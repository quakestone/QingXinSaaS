package com.qingxinsaas.common.tenant.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;

/**
 * 多租户配置属性类
 *
 * @author wwj
 */
@Data
@ConfigurationProperties(prefix = "tenant")
public class TenantProperties {
    /**
     * 是否开启多租户
     */
    private Boolean enable = true;

    /**
     * 租户id字段名
     */
    private String column = "tenant_id";

    /**
     * 需要进行租户id过滤的表名集合
     */
    private List<String> filterTables;

    /**
     * 需要忽略的多租户的表，此配置优先filterTables，若此配置为空则启用filterTables
     */
    private List<String> ignoreTables;
}
