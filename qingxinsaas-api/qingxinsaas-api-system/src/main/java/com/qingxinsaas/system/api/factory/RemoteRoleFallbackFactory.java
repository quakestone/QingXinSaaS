package com.qingxinsaas.system.api.factory;

import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.system.api.RemoteRoleService;
import com.qingxinsaas.system.api.domain.SysRole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 角色服务降级处理
 *
 * @author wwj
 * @date 2024-11-22
 */
@Component
public class RemoteRoleFallbackFactory implements FallbackFactory<RemoteRoleService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteRoleFallbackFactory.class);

    @Override
    public RemoteRoleService create(Throwable throwable) {
        log.error("用户服务调用失败:{}", throwable.getMessage());
        return new RemoteRoleService() {
            @Override
            public R<SysRole> selectRoleById(Long roleId, String source) {
                return R.fail("记录角色信息获取失败:" + throwable.getMessage());
            }
        };
    }
}
