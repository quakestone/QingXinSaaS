// package com.qingxinsaas.flowable.remote;
//
// import com.qingxinsaas.common.core.constant.ServiceNameConstants;
// import com.qingxinsaas.common.core.domain.R;
// import com.qingxinsaas.system.api.domain.SysUser;
// import com.qingxinsaas.system.api.factory.RemoteUserFallbackFactory;
// import org.springframework.cloud.openfeign.FeignClient;
//
// /**
//  * @author wwj
//  * @date 2024-11-22
//  */
// @FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.FLOWABLE_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
// public interface RemoteUserService {
//
//     /**
//      * 通过用户ID查询用户
//      *
//      * @param userId 用户ID
//      * @return 用户对象信息
//      */
//     public R<SysUser> selectUserById(Long userId);
// }
