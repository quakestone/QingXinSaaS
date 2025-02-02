package com.qingxinsaas.flowable.mapper;

import com.qingxinsaas.flowable.domain.SysExpression;

import java.util.List;

/**
 * 流程达式Mapper接口
 *
 * @author wwj
 * @date 2024-11-22
 */
public interface SysExpressionMapper {
    /**
     * 查询流程达式
     *
     * @param id 流程达式主键
     * @return 流程达式
     */
    public SysExpression selectSysExpressionById(Long id);

    /**
     * 查询流程达式列表
     *
     * @param sysExpression 流程达式
     * @return 流程达式集合
     */
    public List<SysExpression> selectSysExpressionList(SysExpression sysExpression);

    /**
     * 新增流程达式
     *
     * @param sysExpression 流程达式
     * @return 结果
     */
    public int insertSysExpression(SysExpression sysExpression);

    /**
     * 修改流程达式
     *
     * @param sysExpression 流程达式
     * @return 结果
     */
    public int updateSysExpression(SysExpression sysExpression);

    /**
     * 删除流程达式
     *
     * @param id 流程达式主键
     * @return 结果
     */
    public int deleteSysExpressionById(Long id);

    /**
     * 批量删除流程达式
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysExpressionByIds(Long[] ids);
}
