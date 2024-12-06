package com.qingxinsaas.flowable.domain.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author wwj
 * @date 2024-11-22
 */
@Data
public class FlowViewerDto implements Serializable {

    /**
     * 流程key
     */
    private String key;

    /**
     * 是否完成(已经审批)
     */
    private boolean completed;

}
