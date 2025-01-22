package com.qingxinsaas.system.service.impl;

import java.util.List;
import com.qingxinsaas.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qingxinsaas.system.mapper.SysTenantPackageMapper;
import com.qingxinsaas.system.domain.SysTenantPackage;
import com.qingxinsaas.system.service.ISysTenantPackageService;

/**
 * 租户套餐Service业务层处理
 *
 * @author wwj
 * @date 2025-01-14
 */
@Service
public class SysTenantPackageServiceImpl implements ISysTenantPackageService
{
    @Autowired
    private SysTenantPackageMapper sysTenantPackageMapper;

    /**
     * 查询租户套餐
     *
     * @param packageId 租户套餐主键
     * @return 租户套餐
     */
    @Override
    public SysTenantPackage selectSysTenantPackageByPackageId(Long packageId)
    {
        return sysTenantPackageMapper.selectSysTenantPackageByPackageId(packageId);
    }

    /**
     * 查询租户套餐列表
     *
     * @param sysTenantPackage 租户套餐
     * @return 租户套餐
     */
    @Override
    public List<SysTenantPackage> selectSysTenantPackageList(SysTenantPackage sysTenantPackage)
    {
        return sysTenantPackageMapper.selectSysTenantPackageList(sysTenantPackage);
    }

    /**
     * 新增租户套餐
     *
     * @param sysTenantPackage 租户套餐
     * @return 结果
     */
    @Override
    public int insertSysTenantPackage(SysTenantPackage sysTenantPackage)
    {
        sysTenantPackage.setCreateTime(DateUtils.getNowDate());
        return sysTenantPackageMapper.insertSysTenantPackage(sysTenantPackage);
    }

    /**
     * 修改租户套餐
     *
     * @param sysTenantPackage 租户套餐
     * @return 结果
     */
    @Override
    public int updateSysTenantPackage(SysTenantPackage sysTenantPackage)
    {
        sysTenantPackage.setUpdateTime(DateUtils.getNowDate());
        return sysTenantPackageMapper.updateSysTenantPackage(sysTenantPackage);
    }

    /**
     * 批量删除租户套餐
     *
     * @param packageIds 需要删除的租户套餐主键
     * @return 结果
     */
    @Override
    public int deleteSysTenantPackageByPackageIds(Long[] packageIds)
    {
        return sysTenantPackageMapper.deleteSysTenantPackageByPackageIds(packageIds);
    }

    /**
     * 删除租户套餐信息
     *
     * @param packageId 租户套餐主键
     * @return 结果
     */
    @Override
    public int deleteSysTenantPackageByPackageId(Long packageId)
    {
        return sysTenantPackageMapper.deleteSysTenantPackageByPackageId(packageId);
    }
}
