package com.qingxinsaas.system.service.impl;

import com.qingxinsaas.common.core.utils.DateUtils;
import com.qingxinsaas.system.api.domain.SysTenant;
import com.qingxinsaas.system.api.domain.vo.SysTenantVo;
import com.qingxinsaas.system.mapper.SysTenantMapper;
import com.qingxinsaas.system.service.ISysDatasourceService;
import com.qingxinsaas.system.service.ISysTenantService;
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

    @Resource
    private ISysDatasourceService sysDatasourceService;

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
     * @param tenantId 租户管理主键
     * @return 租户管理
     */
    @Override
    public SysTenantVo selectSysTenantVoByTenantId(Long tenantId) {
        SysTenantVo sysTenantVo = new SysTenantVo();
        sysTenantVo.setTenant(sysTenantMapper.selectSysTenantByTenantId(tenantId));
        sysTenantVo.setDatasource(sysDatasourceService.selectSysDatasourceByDatasourceId(sysTenantVo.getTenant().getDatasourceId()));
        return sysTenantVo;
    }

    /**
     * 查询租户管理
     *
     * @param domainName 域名
     * @return 租户管理
     */
    @Override
    public SysTenantVo selectSysTenantByDomainName(String domainName) {
        SysTenantVo sysTenantVo = new SysTenantVo();
        sysTenantVo.setTenant(sysTenantMapper.selectSysTenantByDomainName(domainName));
        sysTenantVo.setDatasource(sysDatasourceService.selectSysDatasourceByDatasourceId(sysTenantVo.getTenant().getDatasourceId()));
        return sysTenantVo;
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

    @Override
    public int updateTenantStatus(SysTenant sysTenant) {
        return sysTenantMapper.updateSysTenant(sysTenant);
    }
}
