package com.qingxinsaas.system.api.domain.vo;

import com.qingxinsaas.system.api.domain.SysDatasource;
import com.qingxinsaas.system.api.domain.SysTenant;
import lombok.Data;

/**
 * 租户管理对象 sys_tenant
 *
 * @author wwj
 */
@Data
public class SysTenantVo {
    private static final long serialVersionUID = 1L;

    /** 租户对象 */
    private SysTenant tenant;

    /** 数据源对象 */
    private SysDatasource datasource;
}
