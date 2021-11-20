package com.axjy.pojo.recruit;

import lombok.Data;

import java.io.Serializable;

/**
 * kms_grade
 * @author 
 */
@Data
public class Grade implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 年级名称
     */
    private String gradename;

    private static final long serialVersionUID = 1L;
}