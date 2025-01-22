package com.qingxinsaas.common.tenant.interceptor;

import com.qingxinsaas.common.core.constant.SecurityConstants;
import com.qingxinsaas.common.core.context.SourceContextHolder;
import com.qingxinsaas.common.core.utils.StringUtils;
import com.qingxinsaas.common.security.utils.SecurityUtils;
import com.qingxinsaas.common.tenant.utils.DataSourceUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 租户拦截器
 *
 * @author wwj
 */
@Component
public class TenantInterceptor implements HandlerInterceptor {

    @Resource
    @Lazy
    private DataSourceUtils dataSourceUtils;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // if (!(handler instanceof HandlerMethod) || StringUtils.equals(SecurityConstants.INNER, request.getHeader(SecurityConstants.FROM_SOURCE))) {
        //     return true;
        // }
        //
        // Long tenantId = SecurityUtils.getTenantId();
        // dataSourceUtils.changeDataSource(tenantId);

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 请求结束删除localThread
        // SourceContextHolder.clearDataSourceType();
    }

}
