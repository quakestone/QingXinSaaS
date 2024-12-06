package com.qingxinsaas.flowable.domain.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * @author wwj
 * @date 2024-11-22
 */
@Data
@Schema(description = "工作流任务相关--请求参数")
public class FlowTaskVo {

    @Schema(description = "任务Id")
    private String taskId;

    @Schema(description = "用户Id")
    private String userId;

    @Schema(description = "任务意见")
    private String comment;

    @Schema(description = "流程实例Id")
    private String instanceId;

    @Schema(description = "节点")
    private String targetKey;

    private String deploymentId;

    @Schema(description = "流程环节定义ID")
    private String defId;

    @Schema(description = "子执行流ID")
    private String currentChildExecutionId;

    @Schema(description = "子执行流是否已执行")
    private Boolean flag;

    @Schema(description = "流程变量信息")
    private Map<String, Object> variables;

    @Schema(description = "审批人")
    private String assignee;

    @Schema(description = "候选人")
    private List<String> candidateUsers;

    @Schema(description = "审批组")
    private List<String> candidateGroups;
}
