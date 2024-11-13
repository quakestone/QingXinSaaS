package com.qingxinsaas.flowable.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingxinsaas.common.core.utils.DateUtils;
import com.qingxinsaas.flowable.domain.SysForm;
import com.qingxinsaas.flowable.mapper.SysFormMapper;
import com.qingxinsaas.flowable.service.ISysFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 流程表单Service业务层处理
 *
 * @author wwj
 * @date 2024-11-13
 */
@Service
public class SysFormServiceImpl extends ServiceImpl<SysFormMapper, SysForm> implements ISysFormService {
    @Autowired
    private SysFormMapper sysFormMapper;

    /**
     * 查询流程表单
     *
     * @param formId 流程表单主键
     * @return 流程表单
     */
    @Override
    public SysForm selectSysFormByFormId(Long formId) {
        return sysFormMapper.selectSysFormByFormId(formId);
    }

    /**
     * 查询流程表单列表
     *
     * @param sysForm 流程表单
     * @return 流程表单
     */
    @Override
    public List<SysForm> selectSysFormList(SysForm sysForm) {
        return sysFormMapper.selectSysFormList(sysForm);
    }

    /**
     * 新增流程表单
     *
     * @param sysForm 流程表单
     * @return 结果
     */
    @Override
    public int insertSysForm(SysForm sysForm) {
        sysForm.setCreateTime(DateUtils.getNowDate());
        return sysFormMapper.insertSysForm(sysForm);
    }

    /**
     * 修改流程表单
     *
     * @param sysForm 流程表单
     * @return 结果
     */
    @Override
    public int updateSysForm(SysForm sysForm) {
        sysForm.setUpdateTime(DateUtils.getNowDate());
        return sysFormMapper.updateSysForm(sysForm);
    }

    /**
     * 批量删除流程表单
     *
     * @param formIds 需要删除的流程表单主键
     * @return 结果
     */
    @Override
    public int deleteSysFormByFormIds(Long[] formIds) {
        return sysFormMapper.deleteSysFormByFormIds(formIds);
    }

    /**
     * 删除流程表单信息
     *
     * @param formId 流程表单主键
     * @return 结果
     */
    @Override
    public int deleteSysFormByFormId(Long formId) {
        return sysFormMapper.deleteSysFormByFormId(formId);
    }
}
