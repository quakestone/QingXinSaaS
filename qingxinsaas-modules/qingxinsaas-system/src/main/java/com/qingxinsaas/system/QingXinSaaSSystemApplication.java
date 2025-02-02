package com.qingxinsaas.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.qingxinsaas.common.security.annotation.EnableCustomConfig;
import com.qingxinsaas.common.security.annotation.EnableRyFeignClients;

/**
 * 系统模块
 * 
 * @author ruoyi
 */
@EnableCustomConfig
@EnableRyFeignClients
@SpringBootApplication
public class QingXinSaaSSystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(QingXinSaaSSystemApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
