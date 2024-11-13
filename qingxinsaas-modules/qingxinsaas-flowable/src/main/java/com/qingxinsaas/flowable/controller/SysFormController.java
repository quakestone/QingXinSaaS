package com.qingxinsaas.flowable.controller;

import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.web.page.TableDataInfo;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.flowable.domain.SysForm;
import com.qingxinsaas.flowable.service.ISysFormService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@Api(tags = "流程表单接口")
@RestController
@RequestMapping("/form")
public class SysFormController extends BaseController
{
    @Autowired
    private ISysFormService sysFormService;

    /**
     * 查询流程表单列表
     */
    @ApiOperation("查询流程表单列表")
    @RequiresPermissions("flowable:form:list")
    @GetMapping("/list")
    public TableDataInfo list(SysForm sysForm)
    {
        startPage();
        List<SysForm> list = sysFormService.selectSysFormList(sysForm);
        return getDataTable(list);
    }

    /**
     * 导出流程表单列表
     */
    @ApiOperation("导出流程表单列表")
    @RequiresPermissions("flowable:form:export")
    // @Log(title = "流程表单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysForm sysForm)
    {
        List<SysForm> list = sysFormService.selectSysFormList(sysForm);
        ExcelUtil<SysForm> util = new ExcelUtil<SysForm>(SysForm.class);
        util.exportExcel(response, list, "流程表单数据");
    }

    /**
     * 获取流程表单详细信息
     */
    @ApiOperation("获取流程表单详细信息")
    @RequiresPermissions("flowable:form:query")
    @GetMapping(value = "/{formId}")
    public AjaxResult getInfo(@PathVariable("formId") Long formId)
    {
        return success(sysFormService.selectSysFormByFormId(formId));
    }

    /**
     * 新增流程表单
     */
    @ApiOperation("新增流程表单")
    @RequiresPermissions("flowable:form:add")
    // @Log(title = "流程表单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysForm sysForm)
    {
        return toAjax(sysFormService.insertSysForm(sysForm));
    }

    /**
     * 修改流程表单
     */
    @ApiOperation("修改流程表单")
    @RequiresPermissions("flowable:form:edit")
    // @Log(title = "流程表单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysForm sysForm)
    {
        return toAjax(sysFormService.updateSysForm(sysForm));
    }

    /**
     * 删除流程表单
     */
    @ApiOperation("删除流程表单")
    @RequiresPermissions("flowable:form:remove")
    // @Log(title = "流程表单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{formIds}")
    public AjaxResult remove(@PathVariable Long[] formIds)
    {
        return toAjax(sysFormService.deleteSysFormByFormIds(formIds));
    }
}
