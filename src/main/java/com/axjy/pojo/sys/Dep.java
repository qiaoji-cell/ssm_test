package com.axjy.pojo.sys;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_dep
 * @author 
 */
@Data
public class Dep implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 部门编码
     */
    private String depCode;

    /**
     * 部门名称
     */
    private String depName;

    /**
     * 部门负责人
     */
    private String depPrincipal;

    /**
     * id 0顶层部门
     */
    private Long parentId;

    /**
     * 部门传真
     */
    private String depFax;

    /**
     * 部门电话
     */
    private String depPhone;

    /**
     * 部门类型 1.常规部门 2.销售部门 3.客服部门
     */
    private Long depType;

    /**
     * 部门备注
     */
    private String depRemark;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;



    private static final long serialVersionUID = 1L;
}