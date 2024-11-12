package com.qingxinsaas.flowable.domain;

import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 流程达式对象 sys_expression
 *
 * @author wwj
 * @date 2024-11-08
 */
@Data
@ApiModel(value = "SysExpression", description = "流程达式对象")
public class SysExpression extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 表单主键 */
    private Long id;

    /** 表达式名称 */
    @Excel(name = "表达式名称")
    @ApiModelProperty(value = "表达式名称")
    private String name;

    /** 表达式内容 */
    @Excel(name = "表达式内容")
    @ApiModelProperty(value = "表达式内容")
    private String expression;

    /** 表达式类型 */
    @Excel(name = "表达式类型")
    @ApiModelProperty(value = "表达式类型")
    private String dataType;

    /** 状态 */
    @Excel(name = "状态")
    @ApiModelProperty(value = "状态")
    private Long status;

}