package com.axjy.pojo.base;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_class
 * @author
 * 班级表
 *
 */
@Data
public class Class implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 班级名称
     */
    private String classname;

    /**
     * 年级id
     */
    private Long gradeid;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;

    private static final long serialVersionUID = 1L;
}