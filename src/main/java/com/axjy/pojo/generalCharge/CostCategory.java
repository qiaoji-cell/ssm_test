package com.axjy.pojo.generalCharge;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_cost_category
 * @author 
 */
@Data
public class CostCategory implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 类目名称
     */
    private String costname;

    private static final long serialVersionUID = 1L;
}