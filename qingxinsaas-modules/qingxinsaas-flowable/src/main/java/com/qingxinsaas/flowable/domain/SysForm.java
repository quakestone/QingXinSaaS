package com.qingxinsaas.flowable.domain;

import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 流程表单对象 sys_task_form
 *
 * @author wwj
 * @date 2024-11-22
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "流程表单对象")
public class SysForm extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(description = "主键")
    private Long formId;

    @Excel(name = "表单名称")
    @Schema(description = "表单名称")
    private String formName;

    @Excel(name = "表单内容")
    @Schema(description = "表单内容")
    private String formContent;

}
