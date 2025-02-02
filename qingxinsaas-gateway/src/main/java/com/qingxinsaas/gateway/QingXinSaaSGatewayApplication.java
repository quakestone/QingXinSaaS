package com.qingxinsaas.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 网关启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class QingXinSaaSGatewayApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(QingXinSaaSGatewayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  氢信网关启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
