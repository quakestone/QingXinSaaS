package com.qingxinsaas.flowable.mapper;

import com.qingxinsaas.flowable.domain.vo.FlowProcDefVo;

import java.util.List;

/**
 * 流程定义查询
 *
 * @author wwj
 * @date 2024-11-08
 */
public interface FlowDeployMapper {

    /**
     * 流程定义列表
     *
     * @param name 流程名称
     * @return 结果
     */
    List<FlowProcDefVo> selectDeployList(String name);

}
