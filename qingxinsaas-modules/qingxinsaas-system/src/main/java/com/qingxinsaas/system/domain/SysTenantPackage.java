package com.qingxinsaas.system.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import lombok.Data;

/**
 * 租户套餐对象 sys_tenant_package
 *
 * @author wwj
 * @date 2025-01-08
 */
@Data
public class SysTenantPackage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 租户套餐ID */
    @TableId
    private Long packageId;

    /** 套餐名称 */
    @Excel(name = "套餐名称")
    private String packageName;

    /** 关联菜单id */
    @Excel(name = "关联菜单id")
    private String menuIds;

    /** 套餐状态（0正常 1停用） */
    @Excel(name = "套餐状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0存在 2删除） */
    private String delFlag;

}
