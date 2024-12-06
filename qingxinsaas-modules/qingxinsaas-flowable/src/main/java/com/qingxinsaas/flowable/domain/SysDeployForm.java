package com.qingxinsaas.flowable.domain;

import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程实例关联表单对象 sys_instance_form
 *
 * @author wwj
 * @date 2024-11-22
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "流程实例关联单对象")
public class SysDeployForm extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    @Excel(name = "表单主键")
    @Schema(description = "表单主键")
    private Long formId;

    @Excel(name = "流程定义主键")
    @Schema(description = "流程定义主键")
    private String deployId;

}
