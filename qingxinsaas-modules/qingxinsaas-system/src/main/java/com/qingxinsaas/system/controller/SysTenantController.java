package com.qingxinsaas.system.controller;

import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.common.core.utils.StringUtils;
import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.web.page.TableDataInfo;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.common.security.annotation.InnerAuth;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.common.security.utils.SecurityUtils;
import com.qingxinsaas.system.api.domain.SysUser;
import com.qingxinsaas.system.api.domain.vo.SysTenantVo;
import com.qingxinsaas.system.service.ISysTenantService;
import com.qingxinsaas.system.api.domain.SysTenant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 租户管理Controller
 *
 * @author wwj
 * @date 2024-12-06
 */
@RestController
@RequestMapping("/tenant")
public class SysTenantController extends BaseController {
    @Autowired
    private ISysTenantService sysTenantService;

    /**
     * 状态修改
     */
    @RequiresPermissions("system:tenant:edit")
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysTenant sysTenant)
    {
        return toAjax(sysTenantService.updateTenantStatus(sysTenant));
    }

    /**
     * 查询租户管理列表
     */
    @RequiresPermissions("system:tenant:list")
    @GetMapping("/list")
    public TableDataInfo list(SysTenant sysTenant) {
        startPage();
        List<SysTenant> list = sysTenantService.selectSysTenantList(sysTenant);
        return getDataTable(list);
    }

    /**
     * 导出租户管理列表
     */
    @RequiresPermissions("system:tenant:export")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysTenant sysTenant) {
        List<SysTenant> list = sysTenantService.selectSysTenantList(sysTenant);
        ExcelUtil<SysTenant> util = new ExcelUtil<SysTenant>(SysTenant.class);
        util.exportExcel(response, list, "租户管理数据");
    }

    /**
     * 获取租户管理详细信息
     */
    @RequiresPermissions("system:tenant:query")
    @GetMapping(value = "/{tenantId}")
    public R<SysTenant> getInfo(@PathVariable("tenantId") Long tenantId) {
        return R.ok(sysTenantService.selectSysTenantByTenantId(tenantId));
    }

    /**
     * 获取租户管理详细信息
     */
    @InnerAuth
    @GetMapping(value = "/remote/{tenantId}")
    public R<SysTenantVo> getSysTenantByTenantId(@PathVariable("tenantId") Long tenantId) {
        return R.ok(sysTenantService.selectSysTenantVoByTenantId(tenantId));
    }

    /**
     * 获取租户管理详细信息
     */
    @InnerAuth
    @GetMapping(value = "/remote/domainName")
    public R<SysTenantVo> getSysTenantByDomainName(@RequestParam("domainName") String domainName) {
        SysTenantVo sysTenantVo = sysTenantService.selectSysTenantByDomainName(domainName);
        if (StringUtils.isNull(sysTenantVo))
        {
            return R.fail("租户信息错误");
        }
        return R.ok(sysTenantVo);
    }

    /**
     * 新增租户管理
     */
    @RequiresPermissions("system:tenant:add")
    @PostMapping
    public AjaxResult add(@RequestBody SysTenant sysTenant) {
        return toAjax(sysTenantService.insertSysTenant(sysTenant));
    }

    /**
     * 修改租户管理
     */
    @RequiresPermissions("system:tenant:edit")
    @PutMapping
    public AjaxResult edit(@RequestBody SysTenant sysTenant) {
        return toAjax(sysTenantService.updateSysTenant(sysTenant));
    }

    /**
     * 删除租户管理
     */
    @RequiresPermissions("system:tenant:remove")
    @DeleteMapping("/{tenantIds}")
    public AjaxResult remove(@PathVariable Long[] tenantIds) {
        return toAjax(sysTenantService.deleteSysTenantByTenantIds(tenantIds));
    }
}
