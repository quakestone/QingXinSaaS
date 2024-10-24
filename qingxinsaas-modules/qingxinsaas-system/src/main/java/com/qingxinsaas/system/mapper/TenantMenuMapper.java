package com.qingxinsaas.system.mapper;

import java.util.List;

import com.qingxinsaas.system.domain.TenantMenu;

/**
 * 租户菜单表Mapper接口
 * 
 * @author ywk
 * @date 2024-10-22
 */
public interface TenantMenuMapper 
{
    /**
     * 查询菜单使用数量
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    public int checkMenuExistTenant(Long menuId);

    /**
     * 通过tenantId删除角色和菜单关联
     *
     * @param tenantId 租户
     * @return 结果
     */
    public int deleteRoleMenuByTenantId(Long tenantId);

    /**
     * 批量删除角色菜单关联信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTenantMenu(Long[] ids);

    /**
     * 批量新增角色菜单信息
     *
     * @param tenantMenuList 角色菜单列表
     * @return 结果
     */
    public int batchTenantMenu(List<TenantMenu> tenantMenuList);
}
