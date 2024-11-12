package com.qingxinsaas.flowable.domain;

import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 流程单对象 sys_form
 *
 * @author wwj
 * @date 2024-11-08
 */
@Data
@ApiModel(value = "SysForm", description = "流程单对象")
public class SysForm extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 表单主键 */
    private Long formId;

    /** 表单名称 */
    @Excel(name = "表单名称")
    @ApiModelProperty(value = "表单名称")
    private String formName;

    /** 表单内容 */
    @Excel(name = "表单内容")
    @ApiModelProperty(value = "表单内容")
    private String formContent;

}
