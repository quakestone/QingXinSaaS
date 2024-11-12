package com.qingxinsaas.flowable.domain;

import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 流程监听对象 sys_listener
 *
 * @author wwj
 * @date 2024-11-08
 */
@Data
@ApiModel(value = "SysListener", description = "流程监听对象")
public class SysListener extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 表单主键 */
    private Long id;

    /** 名称 */
    @Excel(name = "名称")
    @ApiModelProperty(value = "名称")
    private String name;

    /** 监听类型 */
    @Excel(name = "监听类型")
    @ApiModelProperty(value = "监听类型")
    private String type;

    /** 事件类型 */
    @Excel(name = "事件类型")
    @ApiModelProperty(value = "事件类型")
    private String eventType;

    /** 值类型 */
    @Excel(name = "值类型")
    @ApiModelProperty(value = "值类型")
    private String valueType;

    /** 执行内容 */
    @Excel(name = "执行内容")
    @ApiModelProperty(value = "执行内容")
    private String value;

    /** 状态 */
    @Excel(name = "状态")
    @ApiModelProperty(value = "状态")
    private Long status;

}
