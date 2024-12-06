package com.qingxinsaas.flowable.domain.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 动态人员、组
 *
 * @author wwj
 * @date 2024-11-22
 */
@Data
@Schema(description = "工作流任务相关-流程进行")
public class FlowNextDto implements Serializable {

    @Schema(description = "审批人类型")
    private String type;

    @Schema(description = "是否需要动态指定任务审批人")
    private String dataType;

    @Schema(description = "流程变量")
    private String vars;

}
