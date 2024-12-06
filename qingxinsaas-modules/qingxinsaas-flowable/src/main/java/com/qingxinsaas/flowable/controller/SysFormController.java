package com.qingxinsaas.flowable.controller;

import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.web.page.TableDataInfo;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.flowable.domain.SysDeployForm;
import com.qingxinsaas.flowable.domain.SysForm;
import com.qingxinsaas.flowable.service.ISysDeployFormService;
import com.qingxinsaas.flowable.service.ISysFormService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 流程表单管理
 *
 * @author wwj
 * @date 2024-11-22
 */
@RestController
@Tag(name = "流程表单管理")
@RequestMapping("/form")
public class SysFormController extends BaseController {
    @Resource
    private ISysFormService sysFormService;

    @Resource
    private ISysDeployFormService sysDeployFormService;

    /**
     * 查询流程表单列表
     */
    @Operation(summary = "查询流程表单列表")
    @RequiresPermissions("flowable:form:list")
    @GetMapping("/list")
    public TableDataInfo list(SysForm sysForm) {
        startPage();
        List<SysForm> list = sysFormService.selectSysFormList(sysForm);
        return getDataTable(list);
    }

    /**
     * 查询所有流程表单列表
     */
    @Operation(summary = "查询所有流程表单列表")
    @GetMapping("/formList")
    public AjaxResult formList(SysForm sysForm) {
        List<SysForm> list = sysFormService.selectSysFormList(sysForm);
        return AjaxResult.success(list);
    }

    /**
     * 导出流程表单列表
     */
    @Operation(summary = "导出流程表单列表")
    @RequiresPermissions("flowable:form:export")
    @Log(title = "流程表单", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(HttpServletResponse response, SysForm sysForm) {
        List<SysForm> list = sysFormService.selectSysFormList(sysForm);
        ExcelUtil<SysForm> util = new ExcelUtil<SysForm>(SysForm.class);
        util.exportExcel(response, list, "form");
        return AjaxResult.success();
    }

    /**
     * 获取流程表单详细信息
     */
    @Operation(summary = "获取流程表单详细信息")
    @RequiresPermissions("flowable:form:query")
    @GetMapping(value = "/{formId}")
    public AjaxResult getInfo(@PathVariable("formId") Long formId) {
        return AjaxResult.success(sysFormService.selectSysFormById(formId));
    }

    /**
     * 新增流程表单
     */
    @Operation(summary = "新增流程表单")
    @RequiresPermissions("flowable:form:add")
    @Log(title = "流程表单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysForm sysForm) {
        return toAjax(sysFormService.insertSysForm(sysForm));
    }

    /**
     * 修改流程表单
     */
    @Operation(summary = "修改流程表单")
    @RequiresPermissions("flowable:form:edit")
    @Log(title = "流程表单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysForm sysForm) {
        return toAjax(sysFormService.updateSysForm(sysForm));
    }

    /**
     * 删除流程表单
     */
    @Operation(summary = "删除流程表单")
    @RequiresPermissions("flowable:form:remove")
    @Log(title = "流程表单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{formIds}")
    public AjaxResult remove(@PathVariable Long[] formIds) {
        return toAjax(sysFormService.deleteSysFormByIds(formIds));
    }

    /**
     * 挂载流程表单
     */
    @Operation(summary = "挂载流程表单")
    @Log(title = "流程表单", businessType = BusinessType.INSERT)
    @PostMapping("/addDeployForm")
    public AjaxResult addDeployForm(@RequestBody SysDeployForm sysDeployForm) {
        return toAjax(sysDeployFormService.insertSysDeployForm(sysDeployForm));
    }
}
