package com.qingxinsaas.flowable.domain;

import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程表达式对象 sys_expression
 *
 * @author wwj
 * @date 2024-11-22
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "流程表达式对象")
public class SysExpression extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键")
    private Long id;

    @Excel(name = "表达式名称")
    @Schema(description = "表达式名称")
    private String name;

    @Excel(name = "表达式内容")
    @Schema(description = "表达式内容")
    private String expression;

    @Excel(name = "表达式类型")
    @Schema(description = "表达式类型")
    private String dataType;

    @Excel(name = "状态")
    @Schema(description = "状态")
    private Integer status;
}
