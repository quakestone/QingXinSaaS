package com.qingxinsaas.system.api.factory;

import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.system.api.RemoteTenantService;
import com.qingxinsaas.system.api.domain.SysTenant;
import com.qingxinsaas.system.api.domain.vo.SysTenantVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 租户服务降级处理
 *
 * @author wwj
 */
@Component
public class RemoteTenantFallbackFactory implements FallbackFactory<RemoteTenantService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteTenantFallbackFactory.class);

    @Override
    public RemoteTenantService create(Throwable throwable) {
        log.error("用户服务调用失败:{}", throwable.getMessage());
        return new RemoteTenantService() {
            @Override
            public R<SysTenantVo> getSysTenantVoByTenantId(Long tenantId, String source) {
                return R.fail("记录租户信息获取失败:" + throwable.getMessage());
            }
            @Override
            public R<SysTenantVo> getSysTenantByDomainName(String domainName, String source) {
                return R.fail("记录租户信息获取失败:" + throwable.getMessage());
            }
        };
    }
}
