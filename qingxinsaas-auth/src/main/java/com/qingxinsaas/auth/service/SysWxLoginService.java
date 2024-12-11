package com.qingxinsaas.auth.service;

import com.qingxinsaas.auth.domain.WxUserInfo;
import com.qingxinsaas.common.core.constant.CacheConstants;
import com.qingxinsaas.common.core.constant.Constants;
import com.qingxinsaas.common.core.constant.SecurityConstants;
import com.qingxinsaas.common.core.constant.UserConstants;
import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.common.core.enums.UserStatus;
import com.qingxinsaas.common.core.exception.ServiceException;
import com.qingxinsaas.common.core.text.Convert;
import com.qingxinsaas.common.core.utils.DateUtils;
import com.qingxinsaas.common.core.utils.StringUtils;
import com.qingxinsaas.common.core.utils.ip.IpUtils;
import com.qingxinsaas.common.redis.service.RedisService;
import com.qingxinsaas.common.security.utils.SecurityUtils;
import com.qingxinsaas.system.api.RemoteUserService;
import com.qingxinsaas.system.api.domain.SysUser;
import com.qingxinsaas.system.api.model.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SysWxLoginService {

    @Autowired
    private RemoteUserService remoteUserService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private SysRecordLogService recordLogService;

    @Autowired
    private RedisService redisService;

    /**
     * 登录
     */
    public LoginUser login(WxUserInfo wxUserInfo,Long tenantId)
    {
        // IP黑名单校验
        String blackStr = Convert.toStr(redisService.getCacheObject(CacheConstants.SYS_LOGIN_BLACKIPLIST));
        if (IpUtils.isMatchedIp(blackStr, IpUtils.getIpAddr()))
        {
            recordLogService.recordLogininfor(wxUserInfo.getNickname(), Constants.LOGIN_FAIL, "很遗憾，访问IP已被列入系统黑名单");
            throw new ServiceException("很遗憾，访问IP已被列入系统黑名单");
        }
        // 查询用户信息
        R<LoginUser> userResult = remoteUserService.getWxUserInfo(wxUserInfo.getOpenid(),tenantId, SecurityConstants.INNER);
        if (R.FAIL == userResult.getCode())
        {
            //如果微信用户登入，用户不存在就注册
//            register(wxUserInfo.getNickname(), wxUserInfo.getOpenid(),tenantId);
            throw new ServiceException("当前租户下，用户不存在");

        }
        LoginUser userInfo = userResult.getData();
        SysUser user = userResult.getData().getSysUser();
        if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            recordLogService.recordLogininfor(wxUserInfo.getNickname(), Constants.LOGIN_FAIL, "对不起，您的账号已被删除");
            throw new ServiceException("对不起，您的账号：" + wxUserInfo.getNickname() + " 已被删除");
        }
        if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            recordLogService.recordLogininfor(wxUserInfo.getNickname(), Constants.LOGIN_FAIL, "用户已停用，请联系管理员");
            throw new ServiceException("对不起，您的账号：" + wxUserInfo.getNickname() + " 已停用");
        }
        recordLogService.recordLogininfor(wxUserInfo.getNickname(), Constants.LOGIN_SUCCESS, "登录成功");
        recordLoginInfo(user.getUserId());
        return userInfo;
    }

    /**
     * 记录登录信息
     *
     * @param userId 用户ID
     */
    public void recordLoginInfo(Long userId)
    {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        // 更新用户登录IP
        sysUser.setLoginIp(IpUtils.getIpAddr());
        // 更新用户登录时间
        sysUser.setLoginDate(DateUtils.getNowDate());
        remoteUserService.recordUserLogin(sysUser, SecurityConstants.INNER);
    }

    public void logout(String loginName)
    {
        recordLogService.recordLogininfor(loginName, Constants.LOGOUT, "退出成功");
    }

    /**
     * 注册
     */
    public void register(String nickName, String openId,Long tenantId)
    {
        // 注册用户信息
        SysUser sysUser = new SysUser();
        sysUser.setUserName(nickName);
        sysUser.setNickName(nickName);
        sysUser.setThirdPartyPlatform("微信");
        sysUser.setThirdPartyOpenid(openId);
        sysUser.setTenantId(tenantId);
        sysUser.setPassword(SecurityUtils.encryptPassword("1008610086"));
        R<?> registerResult = remoteUserService.registerUserInfo(sysUser, SecurityConstants.INNER);

        if (R.FAIL == registerResult.getCode())
        {
            throw new ServiceException(registerResult.getMsg());
        }
        recordLogService.recordLogininfor(nickName, Constants.REGISTER, "注册成功");
    }
}
