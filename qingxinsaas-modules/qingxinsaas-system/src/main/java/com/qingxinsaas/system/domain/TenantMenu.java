package com.qingxinsaas.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;

/**
 * 租户菜单表对象 sys_tenant_menu
 * 
 * @author ywk
 * @date 2024-10-22
 */
@TableName("sys_tenant_menu")
public class TenantMenu extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 租户id */
    private Long tenantId;

    /** 菜单id */
    private Long menuId;

    public void setTenantId(Long tenantId) 
    {
        this.tenantId = tenantId;
    }

    public Long getTenantId() 
    {
        return tenantId;
    }
    public void setMenuId(Long menuId) 
    {
        this.menuId = menuId;
    }

    public Long getMenuId() 
    {
        return menuId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("tenantId", getTenantId())
            .append("menuId", getMenuId())
            .toString();
    }
}
