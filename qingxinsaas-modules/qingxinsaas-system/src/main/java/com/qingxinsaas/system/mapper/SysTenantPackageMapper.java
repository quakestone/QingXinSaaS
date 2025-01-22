package com.qingxinsaas.system.mapper;

import java.util.List;
import com.qingxinsaas.system.domain.SysTenantPackage;

/**
 * 租户套餐Mapper接口
 * 
 * @author wwj
 * @date 2025-01-08
 */
public interface SysTenantPackageMapper 
{
    /**
     * 查询租户套餐
     * 
     * @param packageId 租户套餐主键
     * @return 租户套餐
     */
    public SysTenantPackage selectSysTenantPackageByPackageId(Long packageId);

    /**
     * 查询租户套餐列表
     * 
     * @param sysTenantPackage 租户套餐
     * @return 租户套餐集合
     */
    public List<SysTenantPackage> selectSysTenantPackageList(SysTenantPackage sysTenantPackage);

    /**
     * 新增租户套餐
     * 
     * @param sysTenantPackage 租户套餐
     * @return 结果
     */
    public int insertSysTenantPackage(SysTenantPackage sysTenantPackage);

    /**
     * 修改租户套餐
     * 
     * @param sysTenantPackage 租户套餐
     * @return 结果
     */
    public int updateSysTenantPackage(SysTenantPackage sysTenantPackage);

    /**
     * 删除租户套餐
     * 
     * @param packageId 租户套餐主键
     * @return 结果
     */
    public int deleteSysTenantPackageByPackageId(Long packageId);

    /**
     * 批量删除租户套餐
     * 
     * @param packageIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysTenantPackageByPackageIds(Long[] packageIds);
}
