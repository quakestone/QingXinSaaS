package com.qingxinsaas.system.controller;

import java.util.List;

import com.qingxinsaas.system.api.domain.Tenant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.system.service.ITenantService;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.web.page.TableDataInfo;

/**
 * 租户Controller
 * 
 * @author qingxinsaas
 * @date 2024-10-21
 */
@RestController
@RequestMapping("/tenant")
public class TenantController extends BaseController
{
    @Autowired
    private ITenantService tenantService;

    /**
     * 查询租户列表
     */
    @RequiresPermissions("system:tenant:list")
    @GetMapping("/list")
    public TableDataInfo list(Tenant tenant)
    {
        startPage();
        List<Tenant> list = tenantService.selectTenantList(tenant);
        return getDataTable(list);
    }

    /**
     * 获取租户详细信息
     */
    @RequiresPermissions("system:tenant:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tenantService.selectTenantById(id));
    }

    /**
     * 新增租户
     */
    @RequiresPermissions("system:tenant:add")
    @Log(title = "租户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Tenant tenant)
    {
        return toAjax(tenantService.insertTenant(tenant));
    }

    /**
     * 修改租户
     */
    @RequiresPermissions("system:tenant:edit")
    @Log(title = "租户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Tenant tenant)
    {
        return toAjax(tenantService.updateTenant(tenant));
    }

    /**
     * 删除租户
     */
    @RequiresPermissions("system:tenant:remove")
    @Log(title = "租户", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tenantService.deleteTenantByIds(ids));
    }
}
