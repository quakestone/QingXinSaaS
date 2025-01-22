package com.qingxinsaas.system.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;
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
    @GetMapping("/user/info/{username}")
    public R<LoginUser> getUserInfo(@PathVariable("username") String username, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @param domainName 域名
     * @param source 请求来源
     * @return 结果
     */
    @GetMapping("/user/info/login")
    public R<LoginUser> getLoginUserInfo(@RequestParam("username") String username, @RequestParam("domainName") String domainName, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

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
