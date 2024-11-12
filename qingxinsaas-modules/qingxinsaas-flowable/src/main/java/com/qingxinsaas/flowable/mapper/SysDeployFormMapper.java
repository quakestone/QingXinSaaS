package com.qingxinsaas.flowable.mapper;

import com.qingxinsaas.common.mybatisplus.mapper.BaseMapperX;
import com.qingxinsaas.flowable.domain.SysDeployForm;
import com.qingxinsaas.flowable.domain.SysForm;

import java.util.List;

/**
 * 流程实例关联表单Mapper接口
 *
 * @author wwj
 * @date 2024-11-11
 */
public interface SysDeployFormMapper extends BaseMapperX<SysDeployForm> {
    /**
     * 查询流程实例关联表单
     *
     * @param id 流程实例关联表单ID
     * @return 流程实例关联表单
     */
    public SysDeployForm selectSysDeployFormById(Long id);

    /**
     * 查询流程实例关联表单列表
     *
     * @param SysDeployForm 流程实例关联表单
     * @return 流程实例关联表单集合
     */
    public List<SysDeployForm> selectSysDeployFormList(SysDeployForm SysDeployForm);

    /**
     * 新增流程实例关联表单
     *
     * @param SysDeployForm 流程实例关联表单
     * @return 结果
     */
    public int insertSysDeployForm(SysDeployForm SysDeployForm);

    /**
     * 修改流程实例关联表单
     *
     * @param SysDeployForm 流程实例关联表单
     * @return 结果
     */
    public int updateSysDeployForm(SysDeployForm SysDeployForm);

    /**
     * 删除流程实例关联表单
     *
     * @param id 流程实例关联表单ID
     * @return 结果
     */
    public int deleteSysDeployFormById(Long id);

    /**
     * 批量删除流程实例关联表单
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysDeployFormByIds(Long[] ids);

    /**
     * 查询流程挂着的表单
     *
     * @param deployId
     * @return
     */
    SysForm selectSysDeployFormByDeployId(String deployId);
}
