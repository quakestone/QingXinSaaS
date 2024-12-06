package com.qingxinsaas.flowable.domain.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * @author wwj
 * @date 2024-11-22
 */
@Data
@Schema(description = "工作流任务相关-保存xml")
public class FlowSaveXmlVo implements Serializable {

    @Schema(description = "流程名称")
    private String name;

    @Schema(description = "流程分类")
    private String category;

    @Schema(description = "xml 文件")
    private String xml;
}
