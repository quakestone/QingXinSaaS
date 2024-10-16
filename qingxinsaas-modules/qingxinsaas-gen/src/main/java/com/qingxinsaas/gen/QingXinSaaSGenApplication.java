package com.qingxinsaas.gen;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.qingxinsaas.common.security.annotation.EnableCustomConfig;
import com.qingxinsaas.common.security.annotation.EnableRyFeignClients;

/**
 * 代码生成
 * 
 * @author ruoyi
 */
@EnableCustomConfig
@EnableRyFeignClients
@SpringBootApplication
public class QingXinSaaSGenApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(QingXinSaaSGenApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  代码生成模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
