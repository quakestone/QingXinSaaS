package com.qingxinsaas.system.service;

import com.qingxinsaas.system.api.domain.SysTenant;
import com.qingxinsaas.system.api.domain.vo.SysTenantVo;

import java.util.List;

/**
 * 租户管理Service接口
 *
 * @author wwj
 * @date 2024-12-06
 */
public interface ISysTenantService {
    /**
     * 查询租户管理
     *
     * @param tenantId 租户管理主键
     * @return 租户管理
     */
    public SysTenant selectSysTenantByTenantId(Long tenantId);

    /**
     * 查询租户管理
     *
     * @param tenantId 租户管理主键
     * @return 租户管理
     */
    public SysTenantVo selectSysTenantVoByTenantId(Long tenantId);

    /**
     * 查询租户管理
     *
     * @param domainName 域名
     * @return 租户管理
     */
    public SysTenantVo selectSysTenantByDomainName(String domainName);

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
     * 批量删除租户管理
     *
     * @param tenantIds 需要删除的租户管理主键集合
     * @return 结果
     */
    public int deleteSysTenantByTenantIds(Long[] tenantIds);

    /**
     * 删除租户管理信息
     *
     * @param tenantId 租户管理主键
     * @return 结果
     */
    public int deleteSysTenantByTenantId(Long tenantId);

    /**
     * 修改租户状态
     *
     * @param sysTenant 租户信息
     * @return 结果
     */
    public int updateTenantStatus(SysTenant sysTenant);
}
