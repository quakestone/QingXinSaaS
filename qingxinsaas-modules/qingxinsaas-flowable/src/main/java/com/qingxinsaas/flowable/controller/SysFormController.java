package com.qingxinsaas.flowable.controller;

import com.qingxinsaas.common.core.domain.R;
import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.page.TableDataInfo;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.flowable.domain.SysForm;
import com.qingxinsaas.flowable.service.ISysFormService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 流程表单Controller
 *
 * @author wwj
 * @date 2024-11-13
 */
@Tag(name = "流程表单接口")
@RestController
@RequestMapping("/form")
public class SysFormController extends BaseController {
    @Autowired
    private ISysFormService sysFormService;

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
     * 导出流程表单列表
     */
    @Operation(summary = "导出流程表单列表")
    @RequiresPermissions("flowable:form:export")
    @Log(title = "流程表单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysForm sysForm) {
        List<SysForm> list = sysFormService.selectSysFormList(sysForm);
        ExcelUtil<SysForm> util = new ExcelUtil<SysForm>(SysForm.class);
        util.exportExcel(response, list, "流程表单数据");
    }

    /**
     * 获取流程表单详细信息
     */
    @Operation(summary = "获取流程表单详细信息")
    @RequiresPermissions("flowable:form:query")
    @GetMapping(value = "/{formId}")
    public R<SysForm> getInfo(@PathVariable("formId") Long formId) {
        return R.ok(sysFormService.selectSysFormByFormId(formId));
    }

    /**
     * 新增流程表单
     */
    @Operation(summary = "新增流程表单")
    @RequiresPermissions("flowable:form:add")
    @Log(title = "流程表单", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody SysForm sysForm) {
        return R.ok(sysFormService.insertSysForm(sysForm));
    }

    /**
     * 修改流程表单
     */
    @Operation(summary = "修改流程表单")
    @RequiresPermissions("flowable:form:edit")
    @Log(title = "流程表单", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody SysForm sysForm) {
        return R.ok(sysFormService.updateSysForm(sysForm));
    }

    /**
     * 删除流程表单
     */
    @Operation(summary = "删除流程表单")
    @RequiresPermissions("flowable:form:remove")
    @Log(title = "流程表单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{formIds}")
    public R<Integer> remove(@PathVariable Long[] formIds) {
        return R.ok(sysFormService.deleteSysFormByFormIds(formIds));
    }
}
