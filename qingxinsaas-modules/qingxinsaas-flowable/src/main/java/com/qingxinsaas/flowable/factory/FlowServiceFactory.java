package com.qingxinsaas.flowable.factory;

import org.flowable.engine.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 * 引擎注入封装
 *
 * @author wwj
 * @date 2024-11-08
 */
public class FlowServiceFactory {

    @Autowired
    protected RepositoryService repositoryService;

    @Autowired
    protected RuntimeService runtimeService;

    @Autowired
    protected IdentityService identityService;

    @Autowired
    protected TaskService taskService;

    @Autowired
    protected HistoryService historyService;

    @Autowired
    protected ManagementService managementService;

    @Qualifier("processEngine")
    @Autowired
    protected ProcessEngine processEngine;

}
