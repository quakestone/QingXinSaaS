package com.qingxinsaas.system.datasource;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.flywaydb.core.Flyway;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import javax.sql.DataSource;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 动态数据源
 *
 * @author ywk
 */
public class DynamicDataSource extends AbstractRoutingDataSource {

    private static final Logger log = LoggerFactory.getLogger(DynamicDataSource.class);

    private static final String DATABASE_CHECK_SQL = "SELECT COUNT(*) FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = ?";
    private static final String DATABASE_CREATE_SQL = "CREATE DATABASE `%s` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";

    private final JdbcTemplate jdbcTemplate;

    public static Map<Object, Object> targetTargetDataSources = new ConcurrentHashMap<>();

    public DynamicDataSource(DataSource defaultTargetDataSource, Map<Object, Object> targetDataSources) {
        super.setDefaultTargetDataSource(defaultTargetDataSource);
        super.setTargetDataSources(targetDataSources);
        super.afterPropertiesSet();
        targetTargetDataSources = targetDataSources;
        this.jdbcTemplate = new JdbcTemplate(defaultTargetDataSource);
    }

    /**
     * 添加数据源
     */
    public void addDataSource(String tenant, Map<String, Object> dataSourceProperties) {
        targetTargetDataSources.put(tenant, dataSource(dataSourceProperties));
        super.setTargetDataSources(targetTargetDataSources);
        super.afterPropertiesSet();
    }

    /**
     * 添加数据源，并初始化数据库
     *
     * @param tenant              租户标识
     * @param dataSourceProperties 数据源配置
     */
    public synchronized void addDataSourceAndInitialize(String tenant, Map<String, Object> dataSourceProperties) {
        if (!existDataSource(tenant)) {
            String databaseName = (String) dataSourceProperties.get("database");
            ensureDatabaseExists(databaseName);
            DataSource newDataSource = dataSource(dataSourceProperties);
            targetTargetDataSources.put(tenant, newDataSource);
            super.setTargetDataSources(targetTargetDataSources);
            super.afterPropertiesSet();

            // 执行 Flyway 数据库迁移
            migrateDatabase(newDataSource);
            log.info("数据源 [{}] 初始化完成并已添加", tenant);
        }
    }

    /**
     * 检查数据库是否存在，不存在则创建
     */
    private void ensureDatabaseExists(String databaseName) {
        Integer count = jdbcTemplate.queryForObject(DATABASE_CHECK_SQL, new Object[]{databaseName}, Integer.class);
        if (count == null || count == 0) {
            String createSql = String.format(DATABASE_CREATE_SQL, databaseName);
            jdbcTemplate.execute(createSql);
            log.info("数据库 [{}] 创建成功", databaseName);
        } else {
            log.info("数据库 [{}] 已存在", databaseName);
        }
    }

    /**
     * 使用 Flyway 初始化数据库表结构
     */
    private void migrateDatabase(DataSource dataSource) {
        Flyway flyway = Flyway.configure()
                .dataSource(dataSource)
                .locations("classpath:db/migration") // 存放迁移脚本的路径
                .baselineOnMigrate(true)             // 如果是空数据库，自动创建基线
                .load();
        flyway.migrate();
        log.info("数据库迁移完成");
    }

    /**
     * 设置targetDataSources并记录数据源（这里可以记录每个数据源的最近使用时间，可以做删除不经常使用的数据源）
     */
    @Override
    public void setTargetDataSources(Map<Object, Object> targetDataSources) {
        super.setTargetDataSources(targetDataSources);
        super.afterPropertiesSet();
        targetTargetDataSources = targetDataSources;
    }

    public boolean existDataSource(String tenant) {
        return targetTargetDataSources.containsKey(tenant);
    }

    /**
     * 组装数据源
     */
    public DataSource dataSource(Map<String, Object> dataSourceProperties) {
        DataSource dataSource;
        try {
            dataSource = DruidDataSourceFactory.createDataSource(dataSourceProperties);
        } catch (Exception e) {
            throw new RuntimeException("数据源创建失败", e);
        }
        return dataSource;
    }

    @Override
    protected Object determineCurrentLookupKey() {
        return DynamicDataSourceContextHolder.getDataSourceType();
    }
}