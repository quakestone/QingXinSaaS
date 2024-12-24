package com.qingxinsaas.system.api.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;

/**
 * 租户管理对象 sys_tenant
 * 
 * @author qingxinsaas
 * @date 2024-12-10
 */
public class SysTenant extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 租户id */
    @Excel(name = "租户id")
    private Long tenantId;

    /** 租户名称 */
    @Excel(name = "租户名称")
    private String tenantName;

    /** 数据库连接URL */
    @Excel(name = "数据库连接URL")
    private String dbUrl;

    /** 数据库主机名 */
    @Excel(name = "数据库主机名")
    private String dbHost;

    /** 数据库名称 */
    @Excel(name = "数据库名称")
    private String dbName;

    /** 数据库用户名 */
    @Excel(name = "数据库用户名")
    private String dbUsername;

    /** 数据库密码 */
    @Excel(name = "数据库密码")
    private String dbPassword;

    /** 联系人 */
    @Excel(name = "联系人")
    private String contactName;

    /** 联系人手机 */
    @Excel(name = "联系人手机")
    private String contactMobile;

    /** 过期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "过期时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expireTime;

    /** 租户状态（0正常 1停用） */
    @Excel(name = "租户状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0存在 2删除） */
    private String delFlag;

    /** 租户数据隔离类型 */
    @Excel(name = "租户数据隔离类型")
    private String tenantDataType;

    /** 父租户id */
    @Excel(name = "父租户id")
    private Long parentTenantId;

    public void setTenantId(Long tenantId) 
    {
        this.tenantId = tenantId;
    }

    public Long getTenantId() 
    {
        return tenantId;
    }
    public void setTenantName(String tenantName) 
    {
        this.tenantName = tenantName;
    }

    public String getTenantName() 
    {
        return tenantName;
    }
    public void setDbUrl(String dbUrl) 
    {
        this.dbUrl = dbUrl;
    }

    public String getDbUrl() 
    {
        return dbUrl;
    }
    public void setDbHost(String dbHost) 
    {
        this.dbHost = dbHost;
    }

    public String getDbHost() 
    {
        return dbHost;
    }
    public void setDbName(String dbName) 
    {
        this.dbName = dbName;
    }

    public String getDbName() 
    {
        return dbName;
    }
    public void setDbUsername(String dbUsername) 
    {
        this.dbUsername = dbUsername;
    }

    public String getDbUsername() 
    {
        return dbUsername;
    }
    public void setDbPassword(String dbPassword) 
    {
        this.dbPassword = dbPassword;
    }

    public String getDbPassword() 
    {
        return dbPassword;
    }
    public void setContactName(String contactName) 
    {
        this.contactName = contactName;
    }

    public String getContactName() 
    {
        return contactName;
    }
    public void setContactMobile(String contactMobile) 
    {
        this.contactMobile = contactMobile;
    }

    public String getContactMobile() 
    {
        return contactMobile;
    }
    public void setExpireTime(Date expireTime) 
    {
        this.expireTime = expireTime;
    }

    public Date getExpireTime() 
    {
        return expireTime;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setTenantDataType(String tenantDataType) 
    {
        this.tenantDataType = tenantDataType;
    }

    public String getTenantDataType() 
    {
        return tenantDataType;
    }
    public void setParentTenantId(Long parentTenantId) 
    {
        this.parentTenantId = parentTenantId;
    }

    public Long getParentTenantId() 
    {
        return parentTenantId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("tenantId", getTenantId())
            .append("tenantName", getTenantName())
            .append("dbUrl", getDbUrl())
            .append("dbHost", getDbHost())
            .append("dbName", getDbName())
            .append("dbUsername", getDbUsername())
            .append("dbPassword", getDbPassword())
            .append("contactName", getContactName())
            .append("contactMobile", getContactMobile())
            .append("expireTime", getExpireTime())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("tenantDataType", getTenantDataType())
            .append("parentTenantId", getParentTenantId())
            .toString();
    }
}
