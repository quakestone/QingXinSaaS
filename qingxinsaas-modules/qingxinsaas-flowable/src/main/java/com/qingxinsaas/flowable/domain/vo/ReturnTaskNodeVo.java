package com.qingxinsaas.flowable.domain.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author wwj
 * @date 2024-11-22
 */
@Data
@Schema(description = "可退回节点")
public class ReturnTaskNodeVo {

    @Schema(description = "任务Id")
    private String id;

    @Schema(description = "用户Id")
    private String name;

}
