package com.qingxinsaas.common.core.exception.flowable;

import com.qingxinsaas.common.core.exception.base.BaseException;

/**
 * 工作流异常
 *
 * @author wwj
 * @date 2024-11-22
 */
public class FlowableException extends BaseException {
    private static final long serialVersionUID = 1L;

    public FlowableException(String code, Object[] args) {
        super("flowable", code, args, null);
    }
}
