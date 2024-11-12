package com.qingxinsaas.flowable.domain.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 保存流程设计器内的xml文件Dto
 *
 * @author wwj
 * @date 2024-11-12
 */
@Data
public class FlowSaveXmlDto implements Serializable {

    /**
     * 流程名称
     */
    private String name;

    /**
     * 流程分类
     */
    private String category;

    /**
     * xml 文件
     */
    private String xml;
}
