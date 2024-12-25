package com.qingxinsaas.auth.controller;

import cn.hutool.extra.qrcode.QrCodeUtil;


import com.qingxinsaas.auth.config.WxAppProperties;
import com.qingxinsaas.auth.domain.WxUserInfo;
import com.qingxinsaas.auth.service.SysWxLoginService;
import com.qingxinsaas.auth.utils.WechatUtil;
import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.common.security.service.TokenService;
import com.qingxinsaas.system.api.model.LoginUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;

@Slf4j
@RestController
@RequestMapping("/wx")
public class WxLoginController {

    @Autowired
    private WxAppProperties wxAppProperties;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private SysWxLoginService sysWxLoginService;

    private static Long tenantId1 = null;


    @RequestMapping("/wxCheck")
    public String wxCheck(
            @RequestParam(value = "signature") String signature,
            @RequestParam(value = "timestamp") String timestamp,
            @RequestParam(value = "nonce") String nonce,
            @RequestParam(value = "echostr") String echostr
    ){
        log.info("收到微信校验请求，echostr：{}",echostr);
        return echostr;
    }

    @GetMapping("/wxLogin")
    public R<?> wxLogin(HttpServletResponse response)throws Exception{
        System.out.println("wxAppProperties"+wxAppProperties);
        //回调地址
        String redirectUrl = URLEncoder.encode(wxAppProperties.getRedirectUrl(),"UTF-8");
        //构造二维码地址
        String url = "https://open.weixin.qq.com/connect/oauth2/authorize?" +
                "appid="+wxAppProperties.getAppid()+"&redirect_uri="+redirectUrl+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
        //生成二维码
        BufferedImage qrCodeImage = QrCodeUtil.generate(url, 300, 300);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(qrCodeImage, "png", baos);
        byte[] imageBytes = baos.toByteArray();

        // 将字节数组编码为 Base64
        String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);

        return R.ok(base64Image);
    }

    @GetMapping("/wxCallback")
    public R<?> wxCallback(String code, String state, HttpServletRequest request, HttpServletResponse response,
                                 HttpSession session) throws Exception{
        log.info("获取到的授权码code：{}",code);
        WxUserInfo wxUserInfo = WechatUtil.getUserInfo(wxAppProperties.getAppid(), wxAppProperties.getSecret(), code);
        System.out.println(wxUserInfo);

        //微信用户登入
        LoginUser userInfo = sysWxLoginService.login(wxUserInfo,tenantId1);

        // 获取登录token
        return R.ok(tokenService.createToken(userInfo));
    }



//    获取租户id
        @GetMapping("/saveTenantId")
        public R<?> saveTenantId(@RequestParam("tenantId") String tenantId){
            System.out.println("tenantId"+tenantId);
            tenantId1 = Long.valueOf(tenantId);
            return R.ok();
        }



}
