package com.qingxinsaas.flowable.domain;

import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import lombok.Data;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 流程实例关联单对象 sys_deploy_form
 *
 * @author wwj
 * @date 2024-11-08
 */
@Data
@ApiModel(value = "SysDeployForm", description = "流程实例关联单对象")
public class SysDeployForm extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 表单主键 */
    @Excel(name = "表单主键")
    @ApiModelProperty(value = "表单主键")
    private Long formId;

    /** 流程实例主键 */
    @Excel(name = "流程实例主键")
    @ApiModelProperty(value = "流程实例主键")
    private String deployId;

}
