package com.qingxinsaas.flowable.service.impl;

import com.qingxinsaas.flowable.domain.SysDeployForm;
import com.qingxinsaas.flowable.domain.SysForm;
import com.qingxinsaas.flowable.mapper.SysDeployFormMapper;
import com.qingxinsaas.flowable.service.ISysDeployFormService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * 流程实例关联表单Service业务层处理
 *
 * @author wwj
 * @date 2024-11-22
 */
@Service
public class SysDeployFormServiceImpl implements ISysDeployFormService {

    @Resource
    private SysDeployFormMapper sysDeployFormMapper;

    /**
     * 查询流程实例关联表单
     *
     * @param id 流程实例关联表单ID
     * @return 流程实例关联表单
     */
    @Override
    public SysDeployForm selectSysDeployFormById(Long id) {
        return sysDeployFormMapper.selectSysDeployFormById(id);
    }

    /**
     * 查询流程实例关联表单列表
     *
     * @param sysDeployForm 流程实例关联表单
     * @return 流程实例关联表单
     */
    @Override
    public List<SysDeployForm> selectSysDeployFormList(SysDeployForm sysDeployForm) {
        return sysDeployFormMapper.selectSysDeployFormList(sysDeployForm);
    }

    /**
     * 新增流程实例关联表单
     *
     * @param sysDeployForm 流程实例关联表单
     * @return 结果
     */
    @Override
    public int insertSysDeployForm(SysDeployForm sysDeployForm) {
        SysForm sysForm = sysDeployFormMapper.selectSysDeployFormByDeployId(sysDeployForm.getDeployId());
        if (Objects.isNull(sysForm)) {
            return sysDeployFormMapper.insertSysDeployForm(sysDeployForm);
        } else {
            return 1;
        }
    }

    /**
     * 修改流程实例关联表单
     *
     * @param sysDeployForm 流程实例关联表单
     * @return 结果
     */
    @Override
    public int updateSysDeployForm(SysDeployForm sysDeployForm) {
        return sysDeployFormMapper.updateSysDeployForm(sysDeployForm);
    }

    /**
     * 批量删除流程实例关联表单
     *
     * @param ids 需要删除的流程实例关联表单ID
     * @return 结果
     */
    @Override
    public int deleteSysDeployFormByIds(Long[] ids) {
        return sysDeployFormMapper.deleteSysDeployFormByIds(ids);
    }

    /**
     * 删除流程实例关联表单信息
     *
     * @param id 流程实例关联表单ID
     * @return 结果
     */
    @Override
    public int deleteSysDeployFormById(Long id) {
        return sysDeployFormMapper.deleteSysDeployFormById(id);
    }

    /**
     * 查询流程挂着的表单
     *
     * @param deployId
     * @return
     */
    @Override
    public SysForm selectSysDeployFormByDeployId(String deployId) {
        return sysDeployFormMapper.selectSysDeployFormByDeployId(deployId);
    }
}
