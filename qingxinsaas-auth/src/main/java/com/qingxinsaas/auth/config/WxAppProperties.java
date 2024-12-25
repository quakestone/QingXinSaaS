package com.qingxinsaas.auth.config;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Configuration
@Data
@AllArgsConstructor
@NoArgsConstructor
public class WxAppProperties {
    @Value("${oauth2.wx.appid}")
    private String appid;
    @Value("${oauth2.wx.appsecret}")
    private String secret;
    @Value("${oauth2.wx.redirectUrl}")
    private String redirectUrl;
}
