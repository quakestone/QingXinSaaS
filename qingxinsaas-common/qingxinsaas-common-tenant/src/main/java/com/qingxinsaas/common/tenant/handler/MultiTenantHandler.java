package com.qingxinsaas.common.tenant.handler;

import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.qingxinsaas.common.core.context.SecurityContextHolder;
import com.qingxinsaas.common.security.utils.SecurityUtils;
import com.qingxinsaas.common.tenant.config.properties.TenantProperties;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;

import java.util.ArrayList;
import java.util.List;

/**
 * 多租户处理器实现TenantLineHandler接口
 *
 * @author wwj
 */
public class MultiTenantHandler implements TenantLineHandler {

    private final TenantProperties properties;

    public MultiTenantHandler(TenantProperties properties) {
        this.properties = properties;
    }

    /**
     * 获取租户ID值表达式，只支持单个ID值 (实际应该从用户信息中获取)
     *
     * @return 租户ID值表达式
     */
    @Override
    public Expression getTenantId() {
        // 从用户信息中获取租户ID
        Long tenantId = SecurityContextHolder.getTenantId();
        if (tenantId != null) {
            return new LongValue(tenantId);
        }
        return new LongValue(1);
    }

    /**
     * 获取租户字段名,默认字段名叫: tenant_id
     *
     * @return 租户字段名
     */
    @Override
    public String getTenantIdColumn() {
        return properties.getColumn();
    }

    /**
     * 根据表名判断是否忽略拼接多租户条件
     * <p>
     * 默认都要进行解析并拼接多租户条件
     *
     * @param tableName 表名
     * @return 是否忽略, true:表示忽略，false:需要解析并拼接多租户条件
     */
    @Override
    public boolean ignoreTable(String tableName) {
        //忽略指定表对租户数据的过滤
        List<String> ignoreTables = properties.getIgnoreTables();
        return null != ignoreTables && ignoreTables.contains(tableName);
    }
}
