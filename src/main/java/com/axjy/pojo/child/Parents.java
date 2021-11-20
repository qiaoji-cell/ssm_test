package com.axjy.pojo.child;

import lombok.Data;

import java.io.Serializable;

/**
 * kms_parents
 * @author 
 */
@Data
public class Parents implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 学生编号 引用档案学生表
     */
    private String studentCode;

    /**
     * 关系名称
     */
    private String relationName;

    /**
     * 个人手机号
     */
    private String phone;

    /**
     * 证件类型 引用证件类型表
     */
    private Integer idType;

    /**
     * 证件号码
     */
    private String idCard;

    /**
     * 行业类型 引用行业表
     */
    private Integer business;

    /**
     * 学历表 引用学历表
     */
    private Integer education;

    /**
     * 银行卡号
     */
    private String bankNo;

    /**
     * 工作单位
     */
    private String workUnit;

    /**
     *  邮箱
     */
    private String email;

    /**
     * 家庭住址
     */
    private String homeAddress;

    /**
     * 是否接收短信 1是 2不是
     */
    private Integer isgetmessage;

    /**
     * 是否紧急监护人 1是 2不是
     */
    private Integer isemergencyGuardian;

    private static final long serialVersionUID = 1L;
}