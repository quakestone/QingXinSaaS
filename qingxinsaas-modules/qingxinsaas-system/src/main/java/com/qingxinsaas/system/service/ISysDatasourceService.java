package com.qingxinsaas.system.service;

import com.qingxinsaas.system.api.domain.SysDatasource;

import java.util.List;

/**
 * 数据源配置Service接口
 *
 * @author wwj
 * @date 2025-01-08
 */
public interface ISysDatasourceService {
    /**
     * 查询数据源配置
     *
     * @param datasourceId 数据源配置主键
     * @return 数据源配置
     */
    public SysDatasource selectSysDatasourceByDatasourceId(Long datasourceId);

    /**
     * 查询数据源配置列表
     *
     * @param sysDatasource 数据源配置
     * @return 数据源配置集合
     */
    public List<SysDatasource> selectSysDatasourceList(SysDatasource sysDatasource);

    /**
     * 新增数据源配置
     *
     * @param sysDatasource 数据源配置
     * @return 结果
     */
    public int insertSysDatasource(SysDatasource sysDatasource);

    /**
     * 修改数据源配置
     *
     * @param sysDatasource 数据源配置
     * @return 结果
     */
    public int updateSysDatasource(SysDatasource sysDatasource);

    /**
     * 批量删除数据源配置
     *
     * @param datasourceIds 需要删除的数据源配置主键集合
     * @return 结果
     */
    public int deleteSysDatasourceByDatasourceIds(Long[] datasourceIds);

    /**
     * 删除数据源配置信息
     *
     * @param datasourceId 数据源配置主键
     * @return 结果
     */
    public int deleteSysDatasourceByDatasourceId(Long datasourceId);
}
