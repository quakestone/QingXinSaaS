package com.qingxinsaas.system.api.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.qingxinsaas.common.core.annotation.Excel;
import com.qingxinsaas.common.core.web.domain.BaseEntity;
import lombok.Data;

/**
 * 数据源配置对象 sys_datasource
 *
 * @author wwj
 * @date 2025-01-08
 */
@Data
public class SysDatasource extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 数据源ID */
    @TableId
    private Long datasourceId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 连接地址 */
    @Excel(name = "连接地址")
    private String url;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 数据源状态（0正常 1停用） */
    @Excel(name = "数据源状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0存在 2删除） */
    private String delFlag;

}
