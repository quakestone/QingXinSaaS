package com.qingxinsaas.common.core.web.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 租户Entity基类
 *
 * @author wwj
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class TenantEntity extends BaseEntity
{
    /** 租户ID */
    private Long tenantId;
}
