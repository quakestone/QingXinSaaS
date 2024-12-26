package com.qingxinsaas.system.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import com.qingxinsaas.common.core.constant.SecurityConstants;
import com.qingxinsaas.common.core.constant.ServiceNameConstants;
import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.system.api.domain.SysUser;
import com.qingxinsaas.system.api.factory.RemoteUserFallbackFactory;
import com.qingxinsaas.system.api.model.LoginUser;

/**
 * 用户服务
 * 
 * @author ruoyi
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
public interface RemoteUserService
{
    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @param source 请求来源
     * @return 结果
     */
    @GetMapping("/user/info/{username}/{domainName}")
    public R<LoginUser> getUserInfo(@PathVariable("username") String username,@PathVariable("domainName") String domainName,@RequestHeader(SecurityConstants.FROM_SOURCE) String source);


    /**
     * 通过微信openId查询用户信息
     * @param openId
     * @param source
     * @return
     */
    @GetMapping("/user/wxInfo/{openId}/{tenantId}")
    public R<LoginUser> getWxUserInfo(@PathVariable("openId") String openId,  @PathVariable("tenantId") Long tenantId ,@RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 注册用户信息
     *
     * @param sysUser 用户信息
     * @param source 请求来源
     * @return 结果
     */
    @PostMapping("/user/register")
    public R<Boolean> registerUserInfo(@RequestBody SysUser sysUser, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 记录用户登录IP地址和登录时间
     *
     * @param sysUser 用户信息
     * @param source 请求来源
     * @return 结果
     */
    @PutMapping("/user/recordlogin")
    public R<Boolean> recordUserLogin(@RequestBody SysUser sysUser, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @param source 请求来源
     * @return 用户对象信息
     */
    @GetMapping("/user/remote/{userId}")
    public R<SysUser> selectUserById(@PathVariable("userId") Long userId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);
}
