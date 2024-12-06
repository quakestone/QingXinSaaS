package com.qingxinsaas.flowable.controller;

import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.web.page.TableDataInfo;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.flowable.domain.SysListener;
import com.qingxinsaas.flowable.service.ISysListenerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 流程监听管理
 *
 * @author wwj
 * @date 2024-11-22
 */
@RestController
@Tag(name = "流程监听管理")
@RequestMapping("/listener")
public class SysListenerController extends BaseController {
    @Resource
    private ISysListenerService sysListenerService;

    /**
     * 查询流程监听列表
     */
    @Operation(summary = "查询流程监听列表")
    @RequiresPermissions("system:listener:list")
    @GetMapping("/list")
    public TableDataInfo list(SysListener sysListener) {
        startPage();
        List<SysListener> list = sysListenerService.selectSysListenerList(sysListener);
        return getDataTable(list);
    }

    /**
     * 导出流程监听列表
     */
    @Operation(summary = "导出流程监听列表")
    @RequiresPermissions("system:listener:export")
    @Log(title = "流程监听", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysListener sysListener) {
        List<SysListener> list = sysListenerService.selectSysListenerList(sysListener);
        ExcelUtil<SysListener> util = new ExcelUtil<SysListener>(SysListener.class);
        util.exportExcel(response, list, "流程监听数据");
    }

    /**
     * 获取流程监听详细信息
     */
    @Operation(summary = "获取流程监听详细信息")
    @RequiresPermissions("system:listener:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(sysListenerService.selectSysListenerById(id));
    }

    /**
     * 新增流程监听
     */
    @Operation(summary = "新增流程监听")
    @RequiresPermissions("system:listener:add")
    @Log(title = "流程监听", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysListener sysListener) {
        return toAjax(sysListenerService.insertSysListener(sysListener));
    }

    /**
     * 修改流程监听
     */
    @Operation(summary = "修改流程监听")
    @RequiresPermissions("system:listener:edit")
    @Log(title = "流程监听", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysListener sysListener) {
        return toAjax(sysListenerService.updateSysListener(sysListener));
    }

    /**
     * 删除流程监听
     */
    @Operation(summary = "删除流程监听")
    @RequiresPermissions("system:listener:remove")
    @Log(title = "流程监听", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysListenerService.deleteSysListenerByIds(ids));
    }
}
