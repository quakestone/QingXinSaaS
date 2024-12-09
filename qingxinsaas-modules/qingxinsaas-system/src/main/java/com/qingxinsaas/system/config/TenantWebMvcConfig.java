package com.qingxinsaas.system.config;

import com.qingxinsaas.system.interceptor.TenantInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 租户拦截器配置
 *
 * @author wwj
 */
@Configuration
@ComponentScan("com.qingxinsaas.system")
public class TenantWebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private TenantInterceptor tenantInterceptor;

    /**
     * 自定义拦截规则
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(tenantInterceptor)
                .addPathPatterns("/**")
//                .excludePathPatterns("/login", "/logout", "/refresh", "/user/info/**")
                .order(-9);
    }

}
