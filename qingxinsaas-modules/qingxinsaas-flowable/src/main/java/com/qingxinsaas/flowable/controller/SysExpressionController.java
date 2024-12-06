package com.qingxinsaas.flowable.controller;

import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.web.page.TableDataInfo;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.flowable.domain.SysExpression;
import com.qingxinsaas.flowable.service.ISysExpressionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 流程表达式管理
 *
 * @author wwj
 * @date 2024-11-22
 */
@RestController
@Tag(name = "流程表达式管理")
@RequestMapping("/expression")
public class SysExpressionController extends BaseController {
    @Resource
    private ISysExpressionService sysExpressionService;

    /**
     * 查询流程达式列表
     */
    @Operation(summary = "查询流程达式列表")
    @RequiresPermissions("flowable:expression:list")
    @GetMapping("/list")
    public TableDataInfo list(SysExpression sysExpression) {
        startPage();
        List<SysExpression> list = sysExpressionService.selectSysExpressionList(sysExpression);
        return getDataTable(list);
    }

    /**
     * 导出流程达式列表
     */
    @Operation(summary = "导出流程达式列表")
    @RequiresPermissions("flowable:expression:export")
    @Log(title = "流程达式", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysExpression sysExpression) {
        List<SysExpression> list = sysExpressionService.selectSysExpressionList(sysExpression);
        ExcelUtil<SysExpression> util = new ExcelUtil<SysExpression>(SysExpression.class);
        util.exportExcel(response, list, "流程达式数据");
    }

    /**
     * 获取流程达式详细信息
     */
    @Operation(summary = "获取流程达式详细信息")
    @RequiresPermissions("flowable:expression:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(sysExpressionService.selectSysExpressionById(id));
    }

    /**
     * 新增流程达式
     */
    @Operation(summary = "新增流程达式")
    @RequiresPermissions("flowable:expression:add")
    @Log(title = "流程达式", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysExpression sysExpression) {
        return toAjax(sysExpressionService.insertSysExpression(sysExpression));
    }

    /**
     * 修改流程达式
     */
    @Operation(summary = "修改流程达式")
    @RequiresPermissions("flowable:expression:edit")
    @Log(title = "流程达式", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysExpression sysExpression) {
        return toAjax(sysExpressionService.updateSysExpression(sysExpression));
    }

    /**
     * 删除流程达式
     */
    @Operation(summary = "删除流程达式")
    @RequiresPermissions("flowable:expression:remove")
    @Log(title = "流程达式", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysExpressionService.deleteSysExpressionByIds(ids));
    }
}
