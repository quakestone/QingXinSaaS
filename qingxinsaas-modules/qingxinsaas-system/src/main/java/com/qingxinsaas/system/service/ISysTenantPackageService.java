package com.qingxinsaas.system.service;

import java.util.List;
import com.qingxinsaas.system.domain.SysTenantPackage;

/**
 * 租户套餐Service接口
 *
 * @author wwj
 * @date 2025-01-14
 */
public interface ISysTenantPackageService
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
     * 批量删除租户套餐
     *
     * @param packageIds 需要删除的租户套餐主键集合
     * @return 结果
     */
    public int deleteSysTenantPackageByPackageIds(Long[] packageIds);

    /**
     * 删除租户套餐信息
     *
     * @param packageId 租户套餐主键
     * @return 结果
     */
    public int deleteSysTenantPackageByPackageId(Long packageId);
}
