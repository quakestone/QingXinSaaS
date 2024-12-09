package com.qingxinsaas.common.tenant.interceptor;

import com.qingxinsaas.common.core.utils.StringUtils;
import com.qingxinsaas.common.tenant.datasource.DynamicDataSource;
import com.qingxinsaas.common.tenant.datasource.DynamicDataSourceContextHolder;
import com.qingxinsaas.common.tenant.service.ISysTenantService;
import com.qingxinsaas.system.api.domain.SysTenant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 租户拦截器
 *
 * @author wwj
 */
@Component
public class TenantInterceptor implements HandlerInterceptor {
    private static final Logger log = LoggerFactory.getLogger(TenantInterceptor.class);

    @Autowired
    private DynamicDataSource dynamicDataSource;

    @Autowired
    private ISysTenantService sysTenantService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String tenant = request.getHeader("Tenant");
        // 如果没有提供租户信息，则使用默认租户
        if (tenant == null) {
            tenant = "qingxinsaas";
        }

        log.info("&&&&&&&&&&&&&&&& 租户拦截 &&&&&&&&&&&&&&&&");
        // 判断租户信息是否为空
        if (StringUtils.isNotBlank(tenant)) {
            // 检查是否存在该租户对应的数据源
            if (!dynamicDataSource.existDataSource(tenant)) {
                Map<String, Object> map = new HashMap<>();
                if ("qingxinsaas".equals(tenant)) {
                    map.put("driverClassName", "com.mysql.cj.jdbc.Driver");
                    map.put("url", "jdbc:mysql://localhost:3306/qx-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8");
                    map.put("username", "root");
                    map.put("password", "root");
                    map.put("uniqueResourceName", tenant);
                } else {
                    SysTenant sysTenant = sysTenantService.selectSysTenantByTenantName(tenant);
                    map.put("driverClassName", "com.mysql.cj.jdbc.Driver");
                    map.put("url", sysTenant.getDbUrl());
                    map.put("username", sysTenant.getDbUsername());
                    map.put("password", sysTenant.getDbPassword());
                    map.put("uniqueResourceName", tenant);
                }
                // 添加数据源
                dynamicDataSource.addDataSource(tenant, map);
                log.info("&&&&&&&&&&& 已设置租户:{} 连接信息: {}", tenant, tenant);
            } else {
                log.info("&&&&&&&&&&& 当前租户:{}", tenant);
            }
        } else {
            throw new RuntimeException("缺少租户信息");
        }
        // 为了单次请求，多次连接数据库的情况，这里设置localThread，AbstractRoutingDataSource的方法去获取设置数据源
        DynamicDataSourceContextHolder.setDataSourceType(tenant);

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 请求结束删除localThread
        DynamicDataSourceContextHolder.clearDataSourceType();
    }

}
