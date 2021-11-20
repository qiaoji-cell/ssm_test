package com.axjy.pojo.sys;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_pos_garden
 * @author 
 */
@Data
public class PosGarden implements Serializable {
    /**
     * 职位id 引用职位
     */
    private Long posId;

    /**
     * 园所id 引用园所
     */
    private Long gardenId;

    private static final long serialVersionUID = 1L;
}