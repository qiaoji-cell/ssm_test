package com.axjy.pojo;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_chargetype
 * @author 
 */
@Data
public class ChargeType implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 退费类型
     */
    private String chargeType;

    private static final long serialVersionUID = 1L;
}