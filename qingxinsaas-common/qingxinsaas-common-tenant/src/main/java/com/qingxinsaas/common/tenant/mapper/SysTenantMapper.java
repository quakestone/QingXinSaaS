package com.qingxinsaas.common.tenant.mapper;

import com.qingxinsaas.system.api.domain.SysTenant;

import java.util.List;

/**
 * 租户管理Mapper接口
 *
 * @author wwj
 * @date 2024-12-06
 */
public interface SysTenantMapper {
    /**
     * 查询租户管理
     *
     * @param tenantId 租户管理主键
     * @return 租户管理
     */
    public SysTenant selectSysTenantByTenantId(Long tenantId);

    /**
     * 查询租户管理列表
     *
     * @param sysTenant 租户管理
     * @return 租户管理集合
     */
    public List<SysTenant> selectSysTenantList(SysTenant sysTenant);

    /**
     * 新增租户管理
     *
     * @param sysTenant 租户管理
     * @return 结果
     */
    public int insertSysTenant(SysTenant sysTenant);

    /**
     * 修改租户管理
     *
     * @param sysTenant 租户管理
     * @return 结果
     */
    public int updateSysTenant(SysTenant sysTenant);

    /**
     * 删除租户管理
     *
     * @param tenantId 租户管理主键
     * @return 结果
     */
    public int deleteSysTenantByTenantId(Long tenantId);

    /**
     * 批量删除租户管理
     *
     * @param tenantIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysTenantByTenantIds(Long[] tenantIds);

    /**
     * 查询租户管理
     *
     * @param tenantName 租户管理租户名称
     * @return 租户管理
     */
    SysTenant selectSysTenantByTenantName(String tenantName);
}
