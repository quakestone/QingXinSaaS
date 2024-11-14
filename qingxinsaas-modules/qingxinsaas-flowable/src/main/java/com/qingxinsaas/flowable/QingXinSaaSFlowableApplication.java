package com.qingxinsaas.flowable;

import com.qingxinsaas.common.security.annotation.EnableCustomConfig;
import com.qingxinsaas.common.security.annotation.EnableRyFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 工作流
 *
 * @author wwj
 */
@EnableCustomConfig
@EnableRyFeignClients
@SpringBootApplication
public class QingXinSaaSFlowableApplication {

    public static void main(String[] args) {
        SpringApplication.run(QingXinSaaSFlowableApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  工作流模块启动成功   ლ(´ڡ`ლ)ﾞ ");
    }

}
