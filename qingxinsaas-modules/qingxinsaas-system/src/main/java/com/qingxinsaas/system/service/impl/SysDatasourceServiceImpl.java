package com.qingxinsaas.system.service.impl;

import com.qingxinsaas.common.core.utils.DateUtils;
import com.qingxinsaas.system.api.domain.SysDatasource;
import com.qingxinsaas.system.mapper.SysDatasourceMapper;
import com.qingxinsaas.system.service.ISysDatasourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 数据源配置Service业务层处理
 *
 * @author wwj
 * @date 2025-01-08
 */
@Service
public class SysDatasourceServiceImpl implements ISysDatasourceService {
    @Autowired
    private SysDatasourceMapper sysDatasourceMapper;

    /**
     * 查询数据源配置
     *
     * @param datasourceId 数据源配置主键
     * @return 数据源配置
     */
    @Override
    public SysDatasource selectSysDatasourceByDatasourceId(Long datasourceId) {
        return sysDatasourceMapper.selectSysDatasourceByDatasourceId(datasourceId);
    }

    /**
     * 查询数据源配置列表
     *
     * @param sysDatasource 数据源配置
     * @return 数据源配置
     */
    @Override
    public List<SysDatasource> selectSysDatasourceList(SysDatasource sysDatasource) {
        return sysDatasourceMapper.selectSysDatasourceList(sysDatasource);
    }

    /**
     * 新增数据源配置
     *
     * @param sysDatasource 数据源配置
     * @return 结果
     */
    @Override
    public int insertSysDatasource(SysDatasource sysDatasource) {
        sysDatasource.setCreateTime(DateUtils.getNowDate());
        return sysDatasourceMapper.insertSysDatasource(sysDatasource);
    }

    /**
     * 修改数据源配置
     *
     * @param sysDatasource 数据源配置
     * @return 结果
     */
    @Override
    public int updateSysDatasource(SysDatasource sysDatasource) {
        sysDatasource.setUpdateTime(DateUtils.getNowDate());
        return sysDatasourceMapper.updateSysDatasource(sysDatasource);
    }

    /**
     * 批量删除数据源配置
     *
     * @param datasourceIds 需要删除的数据源配置主键
     * @return 结果
     */
    @Override
    public int deleteSysDatasourceByDatasourceIds(Long[] datasourceIds) {
        return sysDatasourceMapper.deleteSysDatasourceByDatasourceIds(datasourceIds);
    }

    /**
     * 删除数据源配置信息
     *
     * @param datasourceId 数据源配置主键
     * @return 结果
     */
    @Override
    public int deleteSysDatasourceByDatasourceId(Long datasourceId) {
        return sysDatasourceMapper.deleteSysDatasourceByDatasourceId(datasourceId);
    }
}
