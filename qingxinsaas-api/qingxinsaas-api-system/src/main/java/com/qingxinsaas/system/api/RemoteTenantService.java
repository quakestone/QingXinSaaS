package com.qingxinsaas.system.api;

import com.qingxinsaas.common.core.constant.ServiceNameConstants;
import com.qingxinsaas.system.api.factory.RemoteUserFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;

//@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
public interface RemoteTenantService {

}
