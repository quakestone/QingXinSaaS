package com.qingxinsaas.system.api.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 租户管理对象 sys_tenant
 *
 * @author wwj
 * @date 2024-12-06
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SysTenant extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 租户id
     */
    private Long tenantId;

    /**
     * 租户名称
     */
    @Excel(name = "租户名称")
    private String tenantName;

    /**
     * 数据库连接URL
     */
    @Excel(name = "数据库连接URL")
    private String dbUrl;

    /**
     * 数据库主机名
     */
    @Excel(name = "数据库主机名")
    private String dbHost;

    /**
     * 数据库名称
     */
    @Excel(name = "数据库名称")
    private String dbName;

    /**
     * 数据库用户名
     */
    @Excel(name = "数据库用户名")
    private String dbUsername;

    /**
     * 数据库密码
     */
    @Excel(name = "数据库密码")
    private String dbPassword;

    /**
     * 联系人
     */
    @Excel(name = "联系人")
    private String contactName;

    /**
     * 联系人手机
     */
    @Excel(name = "联系人手机")
    private String contactMobile;

    /**
     * 过期时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "过期时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expireTime;

    /**
     * 租户状态（0正常 1停用）
     */
    @Excel(name = "租户状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /**
     * 删除标志（0存在 2删除）
     */
    private String delFlag;

}
