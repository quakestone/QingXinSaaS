package com.qingxinsaas.flowable.controller;

import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.flowable.domain.vo.FlowTaskVo;
import com.qingxinsaas.flowable.service.IFlowInstanceService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 工作流流程实例管理
 *
 * @author wwj
 * @date 2024-11-22
 */
@Slf4j
@Tag(name = "工作流流程实例管理")
@RestController
@RequestMapping("/instance")
public class FlowInstanceController extends BaseController {

    @Resource
    private IFlowInstanceService flowInstanceService;

    @Operation(summary = "根据流程定义id启动流程实例")
    @PostMapping("/startBy/{procDefId}")
    public AjaxResult startById(@Parameter(description = "流程定义id") @PathVariable(value = "procDefId") String procDefId,
                                @Parameter(description = "变量集合,json对象") @RequestBody Map<String, Object> variables) {
        return flowInstanceService.startProcessInstanceById(procDefId, variables);
    }

    @Operation(summary = "激活或挂起流程实例")
    @PostMapping(value = "/updateState")
    public AjaxResult updateState(@Parameter(description = "1:激活,2:挂起", required = true) @RequestParam Integer state,
                                  @Parameter(description = "流程实例ID", required = true) @RequestParam String instanceId) {
        flowInstanceService.updateState(state, instanceId);
        return AjaxResult.success();
    }

    @Operation(summary = "结束流程实例")
    @PostMapping(value = "/stopProcessInstance")
    public AjaxResult stopProcessInstance(@RequestBody FlowTaskVo flowTaskVo) {
        flowInstanceService.stopProcessInstance(flowTaskVo);
        return AjaxResult.success();
    }

    @Operation(summary = "删除流程实例")
    @Log(title = "删除任务", businessType = BusinessType.DELETE)
    @DeleteMapping(value = "/delete/{instanceIds}")
    public AjaxResult delete(@Parameter(description = "流程实例ID", required = true) @PathVariable String[] instanceIds,
                             @Parameter(description = "删除原因") @RequestParam(required = false) String deleteReason) {
        for (String instanceId : instanceIds) {
            flowInstanceService.delete(instanceId, deleteReason);
        }
        return AjaxResult.success();
    }
}
