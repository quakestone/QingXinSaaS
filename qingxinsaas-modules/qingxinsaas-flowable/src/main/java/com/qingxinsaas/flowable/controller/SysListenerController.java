package com.qingxinsaas.flowable.controller;

import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.web.page.TableDataInfo;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.flowable.domain.SysListener;
import com.qingxinsaas.flowable.service.ISysListenerService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 流程监听Controller
 *
 * @author wwj
 * @date 2024-11-12
 */
@Api(tags = "流程监听接口")
@RestController
@RequestMapping("/listener")
public class SysListenerController extends BaseController {
    @Autowired
    private ISysListenerService sysListenerService;

    /**
     * 查询流程监听列表
     */
    @ApiOperation("查询流程监听列表")
    @RequiresPermissions("flowable:listener:list")
    @GetMapping("/list")
    public TableDataInfo list(SysListener sysListener) {
        startPage();
        List<SysListener> list = sysListenerService.selectSysListenerList(sysListener);
        return getDataTable(list);
    }

    /**
     * 导出流程监听列表
     */
    @ApiOperation("导出流程监听列表")
    @RequiresPermissions("flowable:listener:export")
    // @Log(title = "流程监听", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysListener sysListener) {
        List<SysListener> list = sysListenerService.selectSysListenerList(sysListener);
        ExcelUtil<SysListener> util = new ExcelUtil<SysListener>(SysListener.class);
        util.exportExcel(response, list, "流程监听数据");
    }

    /**
     * 获取流程监听详细信息
     */
    @ApiOperation("获取流程监听详细信息")
    @RequiresPermissions("flowable:listener:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(sysListenerService.selectSysListenerById(id));
    }

    /**
     * 新增流程监听
     */
    @ApiOperation("新增流程监听")
    @RequiresPermissions("flowable:listener:add")
    // @Log(title = "流程监听", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysListener sysListener) {
        return toAjax(sysListenerService.insertSysListener(sysListener));
    }

    /**
     * 修改流程监听
     */
    @ApiOperation("修改流程监听")
    @RequiresPermissions("flowable:listener:edit")
    // @Log(title = "流程监听", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysListener sysListener) {
        return toAjax(sysListenerService.updateSysListener(sysListener));
    }

    /**
     * 删除流程监听
     */
    @ApiOperation("删除流程监听")
    @RequiresPermissions("flowable:listener:remove")
    // @Log(title = "流程监听", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(sysListenerService.deleteSysListenerByIds(ids));
    }
}
