package com.qingxinsaas.flowable.controller;

import com.qingxinsaas.common.core.web.controller.BaseController;
import com.qingxinsaas.common.core.web.domain.AjaxResult;
import com.qingxinsaas.common.log.annotation.Log;
import com.qingxinsaas.common.log.enums.BusinessType;
import com.qingxinsaas.flowable.domain.vo.FlowSaveXmlVo;
import com.qingxinsaas.flowable.service.IFlowDefinitionService;
import com.qingxinsaas.flowable.service.impl.FlowDefinitionServiceImpl;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;

/**
 * 工作流程定义
 *
 * @author wwj
 * @date 2024-11-22
 */
@Tag(name = "流程定义")
@RestController
@RequestMapping("/definition")
public class FlowDefinitionController extends BaseController {

    private static final Logger log = LoggerFactory.getLogger(FlowDefinitionServiceImpl.class);

    @Resource
    private IFlowDefinitionService flowDefinitionService;

    @Operation(summary = "流程定义列表")
    @GetMapping(value = "/list")
    public AjaxResult list(@Parameter(description = "当前页码", required = true) @RequestParam Integer pageNum,
                           @Parameter(description = "每页条数", required = true) @RequestParam Integer pageSize,
                           @Parameter(description = "流程名称") @RequestParam(required = false) String name) {
        return AjaxResult.success(flowDefinitionService.list(name, pageNum, pageSize));
    }

    @Operation(summary = "导入流程文件", description = "上传bpmn20的xml文件")
    @PostMapping("/import")
    public AjaxResult importFile(@RequestParam(required = false) String name,
                                 @RequestParam(required = false) String category,
                                 MultipartFile file) {
        InputStream in = null;
        try {
            in = file.getInputStream();
            flowDefinitionService.importFile(name, category, in);
        } catch (Exception e) {
            log.error("导入失败", e);
            return AjaxResult.success(e.getMessage());
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                log.error("关闭输入流出错", e);
            }
        }

        return AjaxResult.success("导入成功");
    }

    @Operation(summary = "读取xml文件")
    @GetMapping("/readXml/{deployId}")
    public AjaxResult readXml(@Parameter(description = "流程定义id") @PathVariable(value = "deployId") String deployId) {
        try {
            return flowDefinitionService.readXml(deployId);
        } catch (Exception e) {
            return AjaxResult.error("加载xml文件异常");
        }

    }

    @Operation(summary = "读取图片文件")
    @GetMapping("/readImage/{deployId}")
    public void readImage(@Parameter(description = "流程定义id") @PathVariable(value = "deployId") String deployId, HttpServletResponse response) {
        OutputStream os = null;
        BufferedImage image = null;
        try {
            image = ImageIO.read(flowDefinitionService.readImage(deployId));
            response.setContentType("image/png");
            os = response.getOutputStream();
            if (image != null) {
                ImageIO.write(image, "png", os);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (os != null) {
                    os.flush();
                    os.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Operation(summary = "保存流程设计器内的xml文件")
    @Log(title = "流程定义", businessType = BusinessType.INSERT)
    @PostMapping("/save")
    public AjaxResult saveXml(@RequestBody FlowSaveXmlVo flowSaveXmlVo) {
        InputStream in = null;
        try {
            in = new ByteArrayInputStream(flowSaveXmlVo.getXml().getBytes(StandardCharsets.UTF_8));
            flowDefinitionService.importFile(flowSaveXmlVo.getName(), flowSaveXmlVo.getCategory(), in);
        } catch (Exception e) {
            log.error("导入失败", e);
            return AjaxResult.error(e.getMessage());
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                log.error("关闭输入流出错", e);
            }
        }
        return AjaxResult.success("导入成功");
    }

    @Operation(summary = "发起流程")
    @Log(title = "发起流程", businessType = BusinessType.INSERT)
    @PostMapping("/start/{procDefId}")
    public AjaxResult start(@Parameter(description = "流程定义id") @PathVariable(value = "procDefId") String procDefId,
                            @Parameter(description = "变量集合,json对象") @RequestBody Map<String, Object> variables) {
        return flowDefinitionService.startProcessInstanceById(procDefId, variables);
    }

    @Operation(summary = "激活或挂起流程定义")
    @Log(title = "激活/挂起流程", businessType = BusinessType.UPDATE)
    @PutMapping(value = "/updateState")
    public AjaxResult updateState(@Parameter(description = "1:激活,2:挂起", required = true) @RequestParam Integer state,
                                  @Parameter(description = "流程部署ID", required = true) @RequestParam String deployId) {
        flowDefinitionService.updateState(state, deployId);
        return AjaxResult.success();
    }

    @Operation(summary = "删除流程")
    @Log(title = "删除流程", businessType = BusinessType.DELETE)
    @DeleteMapping(value = "/{deployIds}")
    public AjaxResult delete(@PathVariable String[] deployIds) {
        for (String deployId : deployIds) {
            flowDefinitionService.delete(deployId);
        }
        return AjaxResult.success();
    }

    // @Operation(summary = "指定流程办理人员列表")
    // @GetMapping("/userList")
    // public AjaxResult userList(SysUser user) {
    //     List<SysUser> list = userService.selectUserList(user);
    //     return AjaxResult.success(list);
    // }
    //
    // @Operation(summary = "指定流程办理组列表")
    // @GetMapping("/roleList")
    // public AjaxResult roleList(SysRole role) {
    //     List<SysRole> list = sysRoleService.selectRoleList(role);
    //     return AjaxResult.success(list);
    // }
    //
    // @Operation(summary = "指定流程达式列表")
    // @GetMapping("/expList")
    // public AjaxResult expList(SysExpression sysExpression) {
    //     List<SysExpression> list = sysExpressionService.selectSysExpressionList(sysExpression);
    //     return AjaxResult.success(list);
    // }

}
