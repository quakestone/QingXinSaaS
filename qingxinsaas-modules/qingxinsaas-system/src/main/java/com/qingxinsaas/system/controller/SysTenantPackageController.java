package com.qingxinsaas.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.qingxinsaas.system.domain.SysTenantPackage;
import com.qingxinsaas.system.service.ISysTenantPackageService;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.page.TableDataInfo;

/**
 * 租户套餐Controller
 *
 * @author wwj
 * @date 2025-01-14
 */
@RestController
@RequestMapping("/package")
public class SysTenantPackageController extends BaseController
{
    @Autowired
    private ISysTenantPackageService sysTenantPackageService;

    /**
     * 查询租户套餐列表
     */
    @RequiresPermissions("system:package:list")
    @GetMapping("/list")
    public TableDataInfo list(SysTenantPackage sysTenantPackage)
    {
        startPage();
        List<SysTenantPackage> list = sysTenantPackageService.selectSysTenantPackageList(sysTenantPackage);
        return getDataTable(list);
    }

    /**
     * 导出租户套餐列表
     */
    @RequiresPermissions("system:package:export")
    @Log(title = "租户套餐", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysTenantPackage sysTenantPackage)
    {
        List<SysTenantPackage> list = sysTenantPackageService.selectSysTenantPackageList(sysTenantPackage);
        ExcelUtil<SysTenantPackage> util = new ExcelUtil<SysTenantPackage>(SysTenantPackage.class);
        util.exportExcel(response, list, "租户套餐数据");
    }

    /**
     * 获取租户套餐详细信息
     */
    @RequiresPermissions("system:package:query")
    @GetMapping(value = "/{packageId}")
    public AjaxResult getInfo(@PathVariable("packageId") Long packageId)
    {
        return success(sysTenantPackageService.selectSysTenantPackageByPackageId(packageId));
    }

    /**
     * 新增租户套餐
     */
    @RequiresPermissions("system:package:add")
    @Log(title = "租户套餐", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysTenantPackage sysTenantPackage)
    {
        return toAjax(sysTenantPackageService.insertSysTenantPackage(sysTenantPackage));
    }

    /**
     * 修改租户套餐
     */
    @RequiresPermissions("system:package:edit")
    @Log(title = "租户套餐", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysTenantPackage sysTenantPackage)
    {
        return toAjax(sysTenantPackageService.updateSysTenantPackage(sysTenantPackage));
    }

    /**
     * 删除租户套餐
     */
    @RequiresPermissions("system:package:remove")
    @Log(title = "租户套餐", businessType = BusinessType.DELETE)
    @DeleteMapping("/{packageIds}")
    public AjaxResult remove(@PathVariable Long[] packageIds)
    {
        return toAjax(sysTenantPackageService.deleteSysTenantPackageByPackageIds(packageIds));
    }
}
