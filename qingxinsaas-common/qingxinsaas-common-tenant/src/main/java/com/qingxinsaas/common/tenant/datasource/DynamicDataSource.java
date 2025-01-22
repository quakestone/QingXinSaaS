package com.qingxinsaas.common.tenant.datasource;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.qingxinsaas.common.core.context.SourceContextHolder;
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

    public static Map<Object, Object> targetTargetDataSources = new ConcurrentHashMap<>();

    public DynamicDataSource(DataSource defaultTargetDataSource, Map<Object, Object> targetDataSources) {
        super.setDefaultTargetDataSource(defaultTargetDataSource);
        super.setTargetDataSources(targetDataSources);
        super.afterPropertiesSet();
        targetTargetDataSources = targetDataSources;
    }

    /**
     * 添加数据源
     */
    public void addDataSource(Long tenant, Map<String, Object> dataSourceProperties) {
        targetTargetDataSources.put(tenant, dataSource(dataSourceProperties));
        super.setTargetDataSources(targetTargetDataSources);
        super.afterPropertiesSet();
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

    public boolean existDataSource(Long tenant) {
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
            throw new RuntimeException();
        }
        return dataSource;
    }

    @Override
    protected Object determineCurrentLookupKey() {
        return SourceContextHolder.getDataSourceType();
    }
}