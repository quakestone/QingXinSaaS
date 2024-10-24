package com.qingxinsaas.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingxinsaas.common.core.constant.UserConstants;
import com.qingxinsaas.common.core.exception.ServiceException;
import com.qingxinsaas.common.core.utils.DateUtils;
import com.qingxinsaas.system.domain.TenantMenu;
import com.qingxinsaas.system.mapper.TenantMenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qingxinsaas.system.mapper.TenantMapper;
import com.qingxinsaas.system.api.domain.Tenant;
import com.qingxinsaas.system.service.ITenantService;

/**
 * 租户Service业务层处理
 * 
 * @author ywk
 * @date 2024-10-21
 */
@Service
public class TenantServiceImpl extends ServiceImpl<TenantMapper, Tenant> implements ITenantService
{
    @Autowired
    private TenantMapper tenantMapper;

    @Autowired
    private TenantMenuMapper tenantMenuMapper;

    /**
     * 查询租户
     * 
     * @param id 租户主键
     * @return 租户
     */
    @Override
    public Tenant selectTenantById(Long id)
    {
        return tenantMapper.selectTenantById(id);
    }

    /**
     * 查询租户列表
     * 
     * @param tenant 租户
     * @return 租户
     */
    @Override
    public List<Tenant> selectTenantList(Tenant tenant)
    {
        return tenantMapper.selectTenantList(tenant);
    }

    /**
     * 新增租户
     * 
     * @param tenant 租户
     * @return 结果
     */
    @Override
    public int insertTenant(Tenant tenant)
    {
        tenant.setCreateTime(DateUtils.getNowDate());
        tenantMapper.insertTenant(tenant);
        return insertTenantMenu(tenant);
    }

    private int insertTenantMenu(Tenant tenant) {
        int rows = 1;
        List<TenantMenu> list = new ArrayList<>();
        for (Long menuId : tenant.getMenuIds()) {
            TenantMenu tm = new TenantMenu();
            tm.setTenantId(tenant.getId());
            tm.setMenuId(menuId);
            list.add(tm);
        }
        if (list.size()>0){
            rows = tenantMenuMapper.batchTenantMenu(list);
        }
        return rows;
    }

    /**
     * 修改租户
     * 
     * @param tenant 租户
     * @return 结果
     */
    @Override
    public int updateTenant(Tenant tenant)
    {
        tenant.setUpdateTime(DateUtils.getNowDate());
        tenantMapper.updateTenant(tenant);
        tenantMenuMapper.deleteRoleMenuByTenantId(tenant.getId());
        return insertTenantMenu(tenant);
    }

    /**
     * 批量删除租户
     * 
     * @param ids 需要删除的租户主键
     * @return 结果
     */
    @Override
    public int deleteTenantByIds(Long[] ids)
    {
        for (Long id : ids) {
            if (id==1L){
                throw new ServiceException("系统租户不能删除");
            }
        }
        // 删除角色与菜单关联
        tenantMenuMapper.deleteTenantMenu(ids);
        return tenantMapper.deleteTenantByIds(ids);
    }

    /**
     * 删除租户信息
     * 
     * @param id 租户主键
     * @return 结果
     */
    @Override
    public int deleteTenantById(Long id)
    {
        return tenantMapper.deleteTenantById(id);
    }

    /**
     * 校验租户名称是否唯一
     * @param tenant
     * @return
     */
    @Override
    public boolean checkTenantUnique(Tenant tenant) {
        try {
            QueryWrapper<Tenant> wrapper = new QueryWrapper<>();
            wrapper.eq("tenant",tenant.getTenant());
            Tenant selectOne = tenantMapper.selectOne(wrapper);
            return UserConstants.UNIQUE;
        } catch (Exception e) {
            return UserConstants.NOT_UNIQUE;
        }
    }
}
