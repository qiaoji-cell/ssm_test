package com.axjy.pojo.base;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_garden
 * @author 
 */
@Data
public class Garden implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 园所编码
     */
    private String gardenCode;

    /**
     * 园所名称
     */
    private String gardenName;

    /**
     * 引用部门表
     */
    private Long parentOrg;

    /**
     * 负责人
     */
    private String gardenPrincipal;

    /**
     * 电话
     */
    private String phone;

    /**
     * 传真
     */
    private String fax;

    /**
     * 备注
     */
    private String remark;


    /**
     * 收/退款单号后缀 幼儿学号前缀
     */


    private String prefixSuffix;

    private static final long serialVersionUID = 1L;
}