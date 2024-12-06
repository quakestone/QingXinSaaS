package com.qingxinsaas.flowable.mapper;

import com.qingxinsaas.flowable.domain.dto.FlowProcDefDto;

import java.util.List;

/**
 * 流程定义查询
 *
 * @author wwj
 * @date 2024-11-22
 */
public interface FlowDeployMapper {

    /**
     * 流程定义列表
     *
     * @param name 流程名称
     * @return 流程定义列表
     */
    List<FlowProcDefDto> selectDeployList(String name);
}
