package com.qingxinsaas.system.api.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;

/**
 * 租户对象 sys_tenant
 * 
 * @author qingxinsaas
 * @date 2024-10-21
 */
public class Tenant extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 租户 */
    @Excel(name = "租户")
    private String tenant;

    /** 数据库连接URL */
    private String url;

    /** 数据库用户名 */
    private String username;

    /** 数据库密码 */
    private String password;

    /** 数据库名 */
    private String databaseName;

    /** 数据库主机名 */
    private String hostName;

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

    /** 删除标志（0代表正常 2代表删除） */
    private String delFlag;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTenant(String tenant) 
    {
        this.tenant = tenant;
    }

    public String getTenant() 
    {
        return tenant;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setDatabaseName(String databaseName) 
    {
        this.databaseName = databaseName;
    }

    public String getDatabaseName() 
    {
        return databaseName;
    }
    public void setHostName(String hostName) 
    {
        this.hostName = hostName;
    }

    public String getHostName() 
    {
        return hostName;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("tenant", getTenant())
            .append("url", getUrl())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("databaseName", getDatabaseName())
            .append("hostName", getHostName())
            .append("contactName", getContactName())
            .append("contactMobile", getContactMobile())
            .append("expireTime", getExpireTime())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
