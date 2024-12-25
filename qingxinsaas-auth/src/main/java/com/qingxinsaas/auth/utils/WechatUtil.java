package com.qingxinsaas.auth.utils;




import com.qingxinsaas.auth.domain.WxTokenInfo;
import com.qingxinsaas.auth.domain.WxUserInfo;
import org.apache.http.HttpEntity;
import org.apache.http.ParseException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;


import java.io.IOException;


public class WechatUtil {

    public  static WxTokenInfo getAccessToken(String appid, String secret, String code) throws Exception {

        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appid +
                "&secret=" + secret +
                "&code=" + code +
                "&grant_type=authorization_code";

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // 创建HttpGet请求
            HttpGet httpGet = new HttpGet(url);

            // 发送请求并获取响应
            try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
                // 处理响应
                if (response.getStatusLine().getStatusCode() == 200) {
                    HttpEntity entity = response.getEntity();
                    String responseBody = EntityUtils.toString(entity);
                    System.out.println("Response: " + responseBody);
                    // 解析JSON响应
                    JSONObject jsonResponse = new JSONObject(responseBody);
                    String accessToken = jsonResponse.getString("access_token");
                    int expiresIn = jsonResponse.getInt("expires_in");
                    String refreshToken = jsonResponse.getString("refresh_token");
                    String openid = jsonResponse.getString("openid");
                    String scope = jsonResponse.getString("scope");
                    //将获取到微信接口响应后的参数传入TokenInfo对象
                    WxTokenInfo wxTokenInfo = new WxTokenInfo(accessToken, expiresIn, refreshToken, openid, scope);


                    return wxTokenInfo;
                } else {
                    System.out.println("请求失败，状态码：" + response.getStatusLine().getStatusCode());
                    return null;
                }
            }
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
        return null;


    }


    public static WxUserInfo getUserInfo(String appid, String secret, String code) throws Exception {
        WxTokenInfo wxTokenInfo = getAccessToken(appid, secret, code);
        String atoken = wxTokenInfo.getAccessToken();
        String openid = wxTokenInfo.getOpenid();
        String url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + atoken +
                "&openid=" + openid +
                "&lang=zh_CN";

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // 创建HttpGet请求
            HttpGet httpGet = new HttpGet(url);

            // 发送请求并获取响应
            try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
                // 处理响应
                if (response.getStatusLine().getStatusCode() == 200) {
                    HttpEntity entity = response.getEntity();
                    String responseBody = EntityUtils.toString(entity,"UTF-8");
                    System.out.println("Response: " + responseBody);
                    // 解析JSON响应
                    JSONObject jsonResponse = new JSONObject(responseBody);
                    WxUserInfo userInfo = new WxUserInfo();
                    userInfo.setOpenid(jsonResponse.getString("openid"));
                    userInfo.setNickname(jsonResponse.getString("nickname"));
                    userInfo.setSex(jsonResponse.getInt("sex"));
                    userInfo.setProvince(jsonResponse.getString("province"));
                    userInfo.setCity(jsonResponse.getString("city"));
                    userInfo.setCountry(jsonResponse.getString("country"));
                    userInfo.setHeadimgurl(jsonResponse.getString("headimgurl"));
                    if (jsonResponse.has("unionid")) {
                        userInfo.setUnionid(jsonResponse.getString("unionid"));
                    }
//                    userInfo.setLanguage(jsonResponse.getString("language"));

                    return userInfo;
                } else {
                    System.out.println("请求失败，状态码：" + response.getStatusLine().getStatusCode());
                    return null;
                }
            }
        } catch (IOException | org.json.JSONException e) {
            e.printStackTrace();
        }
        return null;
    }



}
