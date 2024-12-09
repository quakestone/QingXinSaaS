package com.qingxinsaas.common.tenant.service.impl;

import com.qingxinsaas.common.core.utils.DateUtils;
import com.qingxinsaas.common.tenant.mapper.SysTenantMapper;
import com.qingxinsaas.common.tenant.service.ISysTenantService;
import com.qingxinsaas.system.api.domain.SysTenant;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 租户管理Service业务层处理
 *
 * @author wwj
 * @date 2024-12-06
 */
@Service
public class SysTenantServiceImpl implements ISysTenantService {
    @Resource
    private SysTenantMapper sysTenantMapper;

    /**
     * 查询租户管理
     *
     * @param tenantId 租户管理主键
     * @return 租户管理
     */
    @Override
    public SysTenant selectSysTenantByTenantId(Long tenantId) {
        return sysTenantMapper.selectSysTenantByTenantId(tenantId);
    }

    /**
     * 查询租户管理
     *
     * @param tenantName 租户管理租户名称
     * @return 租户管理
     */
    @Override
    public SysTenant selectSysTenantByTenantName(String tenantName) {
        return sysTenantMapper.selectSysTenantByTenantName(tenantName);
    }

    /**
     * 查询租户管理列表
     *
     * @param sysTenant 租户管理
     * @return 租户管理
     */
    @Override
    public List<SysTenant> selectSysTenantList(SysTenant sysTenant) {
        return sysTenantMapper.selectSysTenantList(sysTenant);
    }

    /**
     * 新增租户管理
     *
     * @param sysTenant 租户管理
     * @return 结果
     */
    @Override
    public int insertSysTenant(SysTenant sysTenant) {
        sysTenant.setCreateTime(DateUtils.getNowDate());
        return sysTenantMapper.insertSysTenant(sysTenant);
    }

    /**
     * 修改租户管理
     *
     * @param sysTenant 租户管理
     * @return 结果
     */
    @Override
    public int updateSysTenant(SysTenant sysTenant) {
        sysTenant.setUpdateTime(DateUtils.getNowDate());
        return sysTenantMapper.updateSysTenant(sysTenant);
    }

    /**
     * 批量删除租户管理
     *
     * @param tenantIds 需要删除的租户管理主键
     * @return 结果
     */
    @Override
    public int deleteSysTenantByTenantIds(Long[] tenantIds) {
        return sysTenantMapper.deleteSysTenantByTenantIds(tenantIds);
    }

    /**
     * 删除租户管理信息
     *
     * @param tenantId 租户管理主键
     * @return 结果
     */
    @Override
    public int deleteSysTenantByTenantId(Long tenantId) {
        return sysTenantMapper.deleteSysTenantByTenantId(tenantId);
    }
}
