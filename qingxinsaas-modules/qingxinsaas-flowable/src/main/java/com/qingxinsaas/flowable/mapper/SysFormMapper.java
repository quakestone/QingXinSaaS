package com.qingxinsaas.flowable.mapper;

import java.util.List;

import com.qingxinsaas.common.mybatisplus.mapper.BaseMapperX;
import com.qingxinsaas.flowable.domain.SysForm;

/**
 * 流程表单Mapper接口
 * 
 * @author wwj
 * @date 2024-11-13
 */
public interface SysFormMapper extends BaseMapperX<SysForm>
{
    /**
     * 查询流程表单
     * 
     * @param formId 流程表单主键
     * @return 流程表单
     */
    public SysForm selectSysFormByFormId(Long formId);

    /**
     * 查询流程表单列表
     * 
     * @param sysForm 流程表单
     * @return 流程表单集合
     */
    public List<SysForm> selectSysFormList(SysForm sysForm);

    /**
     * 新增流程表单
     * 
     * @param sysForm 流程表单
     * @return 结果
     */
    public int insertSysForm(SysForm sysForm);

    /**
     * 修改流程表单
     * 
     * @param sysForm 流程表单
     * @return 结果
     */
    public int updateSysForm(SysForm sysForm);

    /**
     * 删除流程表单
     * 
     * @param formId 流程表单主键
     * @return 结果
     */
    public int deleteSysFormByFormId(Long formId);

    /**
     * 批量删除流程表单
     * 
     * @param formIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysFormByFormIds(Long[] formIds);
}
