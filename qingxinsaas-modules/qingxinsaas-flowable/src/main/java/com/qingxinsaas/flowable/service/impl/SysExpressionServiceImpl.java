package com.qingxinsaas.flowable.service.impl;

import com.qingxinsaas.common.core.utils.DateUtils;
import com.qingxinsaas.flowable.domain.SysExpression;
import com.qingxinsaas.flowable.mapper.SysExpressionMapper;
import com.qingxinsaas.flowable.service.ISysExpressionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 流程达式Service业务层处理
 *
 * @author wwj
 * @date 2024-11-22
 */
@Service
public class SysExpressionServiceImpl implements ISysExpressionService {
    @Resource
    private SysExpressionMapper sysExpressionMapper;

    /**
     * 查询流程达式
     *
     * @param id 流程达式主键
     * @return 流程达式
     */
    @Override
    public SysExpression selectSysExpressionById(Long id) {
        return sysExpressionMapper.selectSysExpressionById(id);
    }

    /**
     * 查询流程达式列表
     *
     * @param sysExpression 流程达式
     * @return 流程达式
     */
    @Override
    public List<SysExpression> selectSysExpressionList(SysExpression sysExpression) {
        return sysExpressionMapper.selectSysExpressionList(sysExpression);
    }

    /**
     * 新增流程达式
     *
     * @param sysExpression 流程达式
     * @return 结果
     */
    @Override
    public int insertSysExpression(SysExpression sysExpression) {
        sysExpression.setCreateTime(DateUtils.getNowDate());
        return sysExpressionMapper.insertSysExpression(sysExpression);
    }

    /**
     * 修改流程达式
     *
     * @param sysExpression 流程达式
     * @return 结果
     */
    @Override
    public int updateSysExpression(SysExpression sysExpression) {
        sysExpression.setUpdateTime(DateUtils.getNowDate());
        return sysExpressionMapper.updateSysExpression(sysExpression);
    }

    /**
     * 批量删除流程达式
     *
     * @param ids 需要删除的流程达式主键
     * @return 结果
     */
    @Override
    public int deleteSysExpressionByIds(Long[] ids) {
        return sysExpressionMapper.deleteSysExpressionByIds(ids);
    }

    /**
     * 删除流程达式信息
     *
     * @param id 流程达式主键
     * @return 结果
     */
    @Override
    public int deleteSysExpressionById(Long id) {
        return sysExpressionMapper.deleteSysExpressionById(id);
    }
}
