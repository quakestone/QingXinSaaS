package com.qingxinsaas.auth.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WxTokenInfo {
    private String accessToken;
    private Integer expiresIn;
    private String refreshToken;
    private String openid;
    private String scope;
}
