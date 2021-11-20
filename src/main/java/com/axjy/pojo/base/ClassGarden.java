package com.axjy.pojo.base;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_class_garden
 * @author 
 */
@Data
public class ClassGarden implements Serializable {
    /**
     * 班级id 引用班级
     */
    private Long classId;

    /**
     * 园所id 引用园所
     */
    private Long gardenId;

    private static final long serialVersionUID = 1L;
}