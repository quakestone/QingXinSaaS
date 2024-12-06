// package com.qingxinsaas.flowable.remote;
//
// import com.qingxinsaas.common.core.constant.ServiceNameConstants;
// import com.qingxinsaas.system.api.domain.SysRole;
// import com.qingxinsaas.system.api.factory.RemoteLogFallbackFactory;
// import org.springframework.cloud.openfeign.FeignClient;
//
// /**
//  * @author wwj
//  * @date 2024-11-22
//  */
// @FeignClient(contextId = "remoteRoleService", value = ServiceNameConstants.FLOWABLE_SERVICE, fallbackFactory = RemoteRoleFallbackFactory.class)
// public interface RemoteRoleService {
//
//     /**
//      * 通过角色ID查询角色
//      *
//      * @param roleId 角色ID
//      * @return 角色对象信息
//      */
//     public SysRole selectRoleById(Long roleId) {
//         return null;
//     }
// }
