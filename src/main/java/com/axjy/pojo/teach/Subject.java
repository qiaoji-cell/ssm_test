package com.axjy.pojo.teach;

import lombok.Data;

import java.io.Serializable;

/**
 * kms_subject
 * @author 
 */
@Data
public class Subject implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 课程名称
     */
    private String gradename;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;

    private static final long serialVersionUID = 1L;
}