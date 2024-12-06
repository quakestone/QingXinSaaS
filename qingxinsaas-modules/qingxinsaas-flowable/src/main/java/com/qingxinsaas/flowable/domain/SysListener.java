package com.qingxinsaas.flowable.domain;

import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程监听对象 sys_listener
 *
 * @author wwj
 * @date 2024-11-22
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "流程监听对象")
public class SysListener extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键")
    private Long id;

    @Excel(name = "名称")
    @Schema(description = "名称")
    private String name;

    @Excel(name = "监听类型")
    @Schema(description = "监听类型")
    private String type;

    @Excel(name = "事件类型")
    @Schema(description = "事件类型")
    private String eventType;

    @Excel(name = "值类型")
    @Schema(description = "值类型")
    private String valueType;

    @Excel(name = "执行内容")
    @Schema(description = "执行内容")
    private String value;

    @Excel(name = "状态")
    @Schema(description = "状态")
    private Integer status;
}
