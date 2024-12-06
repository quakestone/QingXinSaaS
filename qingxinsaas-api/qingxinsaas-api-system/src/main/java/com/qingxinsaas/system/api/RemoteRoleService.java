package com.qingxinsaas.system.api;

import com.qingxinsaas.common.core.constant.SecurityConstants;
import com.qingxinsaas.common.core.constant.ServiceNameConstants;
import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.system.api.domain.SysRole;
import com.qingxinsaas.system.api.factory.RemoteRoleFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * @author wwj
 * @date 2024-11-22
 */
@FeignClient(contextId = "remoteRoleService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteRoleFallbackFactory.class)
public interface RemoteRoleService {
    /**
     * 通过角色ID查询角色
     *
     * @param roleId 角色ID
     * @param source 请求来源
     * @return 角色对象信息
     */
    @GetMapping("/user/remote/{roleId}")
    public R<SysRole> selectRoleById(@PathVariable("roleId") Long roleId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);
}
