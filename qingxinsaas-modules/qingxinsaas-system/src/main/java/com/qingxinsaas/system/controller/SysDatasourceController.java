package com.qingxinsaas.system.controller;

import com.qingxinsaas.common.core.utils.poi.ExcelUtil;
import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.core.web.page.TableDataInfo;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.common.security.annotation.RequiresPermissions;
import com.qingxinsaas.system.api.domain.SysDatasource;
import com.qingxinsaas.system.service.ISysDatasourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 数据源配置Controller
 *
 * @author wwj
 * @date 2025-01-08
 */
@RestController
@RequestMapping("/datasource")
public class SysDatasourceController extends BaseController {
    @Autowired
    private ISysDatasourceService sysDatasourceService;

    /**
     * 查询数据源配置列表
     */
    @RequiresPermissions("system:datasource:list")
    @GetMapping("/list")
    public TableDataInfo list(SysDatasource sysDatasource) {
        startPage();
        List<SysDatasource> list = sysDatasourceService.selectSysDatasourceList(sysDatasource);
        return getDataTable(list);
    }

    /**
     * 导出数据源配置列表
     */
    @RequiresPermissions("system:datasource:export")
    @Log(title = "数据源配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysDatasource sysDatasource) {
        List<SysDatasource> list = sysDatasourceService.selectSysDatasourceList(sysDatasource);
        ExcelUtil<SysDatasource> util = new ExcelUtil<SysDatasource>(SysDatasource.class);
        util.exportExcel(response, list, "数据源配置数据");
    }

    /**
     * 获取数据源配置详细信息
     */
    @RequiresPermissions("system:datasource:query")
    @GetMapping(value = "/{datasourceId}")
    public AjaxResult getInfo(@PathVariable("datasourceId") Long datasourceId) {
        return success(sysDatasourceService.selectSysDatasourceByDatasourceId(datasourceId));
    }

    /**
     * 新增数据源配置
     */
    @RequiresPermissions("system:datasource:add")
    @Log(title = "数据源配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysDatasource sysDatasource) {
        return toAjax(sysDatasourceService.insertSysDatasource(sysDatasource));
    }

    /**
     * 修改数据源配置
     */
    @RequiresPermissions("system:datasource:edit")
    @Log(title = "数据源配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysDatasource sysDatasource) {
        return toAjax(sysDatasourceService.updateSysDatasource(sysDatasource));
    }

    /**
     * 删除数据源配置
     */
    @RequiresPermissions("system:datasource:remove")
    @Log(title = "数据源配置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{datasourceIds}")
    public AjaxResult remove(@PathVariable Long[] datasourceIds) {
        return toAjax(sysDatasourceService.deleteSysDatasourceByDatasourceIds(datasourceIds));
    }
}
