package com.qingxinsaas.common.tenant.interceptor;

import com.qingxinsaas.common.core.utils.StringUtils;
import com.qingxinsaas.common.tenant.datasource.DynamicDataSource;
import com.qingxinsaas.common.tenant.datasource.DynamicDataSourceContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
public class TenantInterceptor implements HandlerInterceptor {

    @Autowired
    private DynamicDataSource dynamicDataSource;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String tenant = request.getHeader("Tenant");
        if (tenant == null) {
            tenant = "qingxinsaas";
        }

        log.info("&&&&&&&&&&&&&&&& 租户拦截 &&&&&&&&&&&&&&&&");
        if (StringUtils.isNotBlank(tenant)) {
            if (!dynamicDataSource.existDataSource(tenant)) {

                Map<String, Object> map = new HashMap<>();
                map.put("driverClassName", "com.mysql.cj.jdbc.Driver");
                map.put("url", "jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8");
                map.put("username", "root");
                map.put("password", "root");
                map.put("uniqueResourceName", tenant);
                dynamicDataSource.addDataSource(tenant, map);
                log.info("&&&&&&&&&&& 已设置租户:{} 连接信息: {}", tenant, tenant);
            }else {
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
