package com.qingxinsaas.system.api.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 租户管理对象 sys_tenant
 *
 * @author wwj
 */
@Data
public class SysTenant extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 租户ID */
    @TableId
    private Long tenantId;

    /** 租户名称 */
    @Excel(name = "租户名称")
    private String tenantName;

    /** 数据源ID */
    @Excel(name = "数据源ID")
    private Long datasourceId;

    /** 租户域名 */
    @Excel(name = "租户域名")
    private String domainName;

    /** 租户logo */
    @Excel(name = "租户logo")
    private String logo;

    /** 联系人 */
    @Excel(name = "联系人")
    private String contactName;

    /** 联系人电话 */
    @Excel(name = "联系人电话")
    private String contactPhone;

    /** 租户套餐ID */
    @Excel(name = "租户套餐ID")
    private Long packageId;

    /** 过期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "过期时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expireTime;

    /** 租户状态（0正常 1停用） */
    @Excel(name = "租户状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0存在 2删除） */
    private String delFlag;

    /** 父租户ID */
    @Excel(name = "父租户ID")
    private Long parentId;

    /** 父租户名称 */
    @TableField(exist = false)
    private Long parentName;

    /** 数据源对象 */
    @TableField(exist = false)
    private SysDatasource datasource;

}
