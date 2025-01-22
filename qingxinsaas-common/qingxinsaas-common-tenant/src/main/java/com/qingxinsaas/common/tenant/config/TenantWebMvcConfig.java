package com.qingxinsaas.common.tenant.config;

import com.qingxinsaas.common.tenant.interceptor.TenantInterceptor;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

/**
 * 租户拦截器配置
 *
 * @author wwj
 */
@Configuration
@ComponentScan("com.qingxinsaas.common.tenant")
public class TenantWebMvcConfig implements WebMvcConfigurer {

    @Resource
    private TenantInterceptor tenantInterceptor;

    /**
     * 自定义拦截规则
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(tenantInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/login", "/logout", "/refresh")
                .order(-9);
    }

}
