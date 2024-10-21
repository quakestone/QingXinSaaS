package com.qingxinsaas.system.mapper;

import java.util.List;
import com.qingxinsaas.system.api.domain.Tenant;

/**
 * 租户Mapper接口
 * 
 * @author qingxinsaas
 * @date 2024-10-21
 */
public interface TenantMapper 
{
    /**
     * 查询租户
     * 
     * @param id 租户主键
     * @return 租户
     */
    public Tenant selectTenantById(Long id);

    /**
     * 查询租户列表
     * 
     * @param tenant 租户
     * @return 租户集合
     */
    public List<Tenant> selectTenantList(Tenant tenant);

    /**
     * 新增租户
     * 
     * @param tenant 租户
     * @return 结果
     */
    public int insertTenant(Tenant tenant);

    /**
     * 修改租户
     * 
     * @param tenant 租户
     * @return 结果
     */
    public int updateTenant(Tenant tenant);

    /**
     * 删除租户
     * 
     * @param id 租户主键
     * @return 结果
     */
    public int deleteTenantById(Long id);

    /**
     * 批量删除租户
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTenantByIds(Long[] ids);
}
