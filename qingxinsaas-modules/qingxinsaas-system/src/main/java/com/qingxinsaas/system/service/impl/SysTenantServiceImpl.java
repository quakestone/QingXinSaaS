package com.qingxinsaas.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qingxinsaas.common.core.utils.DateUtils;
import com.qingxinsaas.system.api.domain.SysTenant;
import com.qingxinsaas.system.api.domain.SysUser;
import com.qingxinsaas.system.datasource.DynamicDataSource;
import com.qingxinsaas.system.datasource.DynamicDataSourceContextHolder;
import com.qingxinsaas.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qingxinsaas.system.mapper.SysTenantMapper;

import com.qingxinsaas.system.service.ISysTenantService;

/**
 * 租户管理Service业务层处理
 * 
 * @author qingxinsaas
 * @date 2024-12-10
 */
@Service
public class SysTenantServiceImpl implements ISysTenantService 
{
    @Autowired
    private SysTenantMapper sysTenantMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private DynamicDataSource dynamicDataSource;

    /**
     * 查询租户管理
     * 
     * @param tenantId 租户管理主键
     * @return 租户管理
     */
    @Override
    public SysTenant selectSysTenantByTenantId(Long tenantId)
    {
        return sysTenantMapper.selectSysTenantByTenantId(tenantId);
    }

    /**
     * 查询租户管理列表
     * 
     * @param sysTenant 租户管理
     * @return 租户管理
     */
    @Override
    public List<SysTenant> selectSysTenantList(SysTenant sysTenant)
    {
        return sysTenantMapper.selectSysTenantList(sysTenant);
    }

    /**
     * 新增租户管理
     * 
     * @param sysTenant 租户管理
     * @return 结果
     */
    @Override
    public int insertSysTenant(SysTenant sysTenant)
    {
        sysTenant.setCreateTime(DateUtils.getNowDate());
        SysUser newUser = new SysUser();
        newUser.setNickName(sysTenant.getContactName());
        newUser.setUserName("admin");
        newUser.setPhonenumber(sysTenant.getContactMobile());
        newUser.setPassword("123456");
        int i = sysTenantMapper.insertSysTenant(sysTenant);
        if (i>0){
            String tenant = sysTenant.getTenantName();
            Map<String, Object> map = new HashMap<>();
            map.put("driverClassName", "com.mysql.cj.jdbc.Driver");
            map.put("url", sysTenant.getDbUrl() != null ? sysTenant.getDbUrl() : "jdbc:mysql://" + sysTenant.getDbHost() + "/" + sysTenant.getDbName() + "?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8");
            map.put("username", sysTenant.getDbUsername());
            map.put("password", sysTenant.getDbPassword());
            map.put("database", sysTenant.getDbName());
            // 添加数据源
            dynamicDataSource.addDataSourceAndInitialize(tenant, map);
            DynamicDataSourceContextHolder.setDataSourceType(tenant);
            sysUserMapper.insertUser(newUser);
            sysTenantMapper.insertSysTenant(sysTenant);
        }

        return i;
    }

    /**
     * 修改租户管理
     * 
     * @param sysTenant 租户管理
     * @return 结果
     */
    @Override
    public int updateSysTenant(SysTenant sysTenant)
    {
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
    public int deleteSysTenantByTenantIds(Long[] tenantIds)
    {
        return sysTenantMapper.deleteSysTenantByTenantIds(tenantIds);
    }

    /**
     * 删除租户管理信息
     * 
     * @param tenantId 租户管理主键
     * @return 结果
     */
    @Override
    public int deleteSysTenantByTenantId(Long tenantId)
    {
        return sysTenantMapper.deleteSysTenantByTenantId(tenantId);
    }

    @Override
    public SysTenant selectSysTenantByTenantName(String tenant) {
        return sysTenantMapper.selectSysTenantByTenantName(tenant);
    }
}
