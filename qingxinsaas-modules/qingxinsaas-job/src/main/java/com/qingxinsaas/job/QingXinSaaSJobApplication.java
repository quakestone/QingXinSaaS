package com.qingxinsaas.job;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.qingxinsaas.common.security.annotation.EnableCustomConfig;
import com.qingxinsaas.common.security.annotation.EnableRyFeignClients;

/**
 * 定时任务
 * 
 * @author ruoyi
 */
@EnableCustomConfig
@EnableRyFeignClients   
@SpringBootApplication
public class QingXinSaaSJobApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(QingXinSaaSJobApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  定时任务模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
