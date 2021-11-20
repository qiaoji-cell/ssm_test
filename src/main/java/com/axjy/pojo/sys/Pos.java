package com.axjy.pojo.sys;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_pos
 * @author 
 */
@Data
public class Pos implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 职位名称
     */
    private String posName;

    /**
     * 职位描述
     */
    private String posDesc;

    /**
     * 岗位职责
     */
    private String posDuty;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;

    private static final long serialVersionUID = 1L;
}