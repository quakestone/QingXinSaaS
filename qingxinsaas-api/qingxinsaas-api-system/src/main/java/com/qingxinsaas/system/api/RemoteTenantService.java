package com.qingxinsaas.system.api;

import com.qingxinsaas.common.core.constant.SecurityConstants;
import com.qingxinsaas.common.core.constant.ServiceNameConstants;
import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.system.api.domain.SysTenant;
import com.qingxinsaas.system.api.domain.vo.SysTenantVo;
import com.qingxinsaas.system.api.factory.RemoteTenantFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 租户服务
 *
 * @author wwj
 */
@FeignClient(contextId = "remoteTenantService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteTenantFallbackFactory.class)
public interface RemoteTenantService {

    /**
     * 获取租户管理详细信息
     *
     * @param tenantId 租户ID
     * @param source   请求来源
     * @return 结果
     */
    @GetMapping("/tenant/remote/{tenantId}")
    public R<SysTenantVo> getSysTenantVoByTenantId(@PathVariable("tenantId") Long tenantId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 获取租户管理详细信息
     *
     * @param domainName 域名
     * @param source     请求来源
     * @return 结果
     */
    @GetMapping("/tenant/remote/domainName")
    public R<SysTenantVo> getSysTenantByDomainName(@RequestParam("domainName") String domainName, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

}
