package com.qingxinsaas.common.tenant.utils;

import com.qingxinsaas.common.core.constant.SecurityConstants;
import com.qingxinsaas.common.core.context.SecurityContextHolder;
import com.qingxinsaas.common.core.context.SourceContextHolder;
import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.common.core.exception.UtilException;
import com.qingxinsaas.common.core.utils.StringUtils;
import com.qingxinsaas.common.tenant.datasource.DynamicDataSource;
import com.qingxinsaas.system.api.RemoteTenantService;
import com.qingxinsaas.system.api.domain.SysDatasource;
import com.qingxinsaas.system.api.domain.SysTenant;
import com.qingxinsaas.system.api.domain.vo.SysTenantVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 源管理工具类
 *
 * @author wwj
 * @date 2025-01-03
 */
@Component
public class DataSourceUtils {
    private static final Logger log = LoggerFactory.getLogger(DataSourceUtils.class);

    @Resource
    private DynamicDataSource dynamicDataSource;

    @Resource
    private RemoteTenantService tenantService;

    /**
     * 切换数据源
     *
     * @param domainName 域名
     */
    public void changeDataSource(String domainName) {
        if (StringUtils.isEmpty(domainName)) {
            throw new UtilException("获取域名信息失败");
        }
        System.out.println(domainName);
        R<SysTenantVo> tenantResult = tenantService.getSysTenantByDomainName(domainName, SecurityConstants.INNER);
        SysTenantVo tenantVo = checkTenantVo(tenantResult);
        SysTenant tenant = tenantVo.getTenant();
        SysDatasource datasource = tenantVo.getDatasource();

        Long tenantId = tenant.getTenantId();
        // 检查是否存在该租户对应的数据源
        if (!dynamicDataSource.existDataSource(tenantId)) {
            Map<String, Object> map = datasourceToMap(datasource, tenantId);
            // 添加数据源
            dynamicDataSource.addDataSource(tenantId, map);
            log.info("已设置租户:{} 连接信息: {}", tenantId, tenant);
        } else {
            log.info("当前租户:{}", tenantId);
        }
        SourceContextHolder.setDataSourceType(tenantId);
        SecurityContextHolder.setTenantId(tenantId.toString());
    }

    /**
     * 切换数据源
     *
     * @param tenantId 租户ID
     */
    public void changeDataSource(Long tenantId) {
        if (tenantId == null) {
            throw new UtilException("缺少租户信息");
        }

        if (!dynamicDataSource.existDataSource(tenantId)) {
            R<SysTenantVo> tenantResult = tenantService.getSysTenantVoByTenantId(tenantId, SecurityConstants.INNER);
            SysTenantVo tenantVo = checkTenantVo(tenantResult);
            Map<String, Object> map = datasourceToMap(tenantVo.getDatasource(), tenantId);
            dynamicDataSource.addDataSource(tenantId, map);
            log.info("已设置租户:{} 连接信息: {}", tenantId, tenantVo.getDatasource());
        } else {
            log.info("当前租户:{}", tenantId);
        }
        SourceContextHolder.setDataSourceType(tenantId);
        SecurityContextHolder.setTenantId(tenantId.toString());
    }

    /**
     * 检查租户对象
     *
     * @param tenantResult 租户结果
     * @return SysTenantVo对象
     */
    public SysTenantVo checkTenantVo(R<SysTenantVo> tenantResult) {
        if (R.FAIL == tenantResult.getCode()) {
            throw new UtilException(tenantResult.getMsg());
        }
        SysTenantVo tenantVo = tenantResult.getData();
        SysTenant tenant = tenantVo.getTenant();
        if (StringUtils.isNull(tenant) || StringUtils.isNull(tenant.getTenantId())) {
            throw new UtilException("获取租户信息失败");
        }
        SysDatasource datasource = tenantVo.getDatasource();
        if (StringUtils.isNull(datasource)) {
            throw new UtilException("获取数据源信息失败");
        }
        return tenantVo;
    }

    /**
     * 将数据源对象转成数据源Map
     *
     * @param datasource 数据源对象
     * @param tenantId   租户ID
     * @return 数据源Map
     */
    public static Map<String, Object> datasourceToMap(SysDatasource datasource, Long tenantId) {
        Map<String, Object> map = new HashMap<>();
        map.put("driverClassName", "com.mysql.cj.jdbc.Driver");
        map.put("url", datasource.getUrl());
        map.put("username", datasource.getUsername());
        map.put("password", datasource.getPassword());
        map.put("uniqueResourceName", tenantId);
        return map;
    }
}
