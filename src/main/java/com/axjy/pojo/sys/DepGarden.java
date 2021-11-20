package com.axjy.pojo.sys;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_dep_garden
 * @author 
 */
@Data
public class DepGarden implements Serializable {
    /**
     * 部门id 引用部门
     */
    private Long depId;

    /**
     * 园所id 引用园所
     */
    private Long gardenId;

    private static final long serialVersionUID = 1L;
}