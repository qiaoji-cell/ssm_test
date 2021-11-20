package com.axjy.pojo.sys;

import java.io.Serializable;
import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kms_business
 * @author 
 */
@Data
public class Business implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 企业编码
     */
    private String businessCode;

    /**
     * 企业品牌
     */
    private String make;

    /**
     * 企业全称
     */
    private String businessName;

    /**
     * 企业简称
     */
    private String businessShort;

    /**
     * 英文名称
     */
    private String businessEnname;

    /**
     * 所属行业
     */
    private String trade;

    /**
     * 企业类型
     */
    private String enterprise;

    /**
     * 邮政编码
     */
    private Long encoded;

    /**
     * 公司电话
     */
    private String telephony;

    /**
     * 传真号码
     */
    private String transmission;

    /**
     * 公司网站
     */
    private String website;

    /**
     * 公司邮箱
     */
    private String email;

    /**
     * 法人代表
     */
    private String legalPerson;

    /**
     * 注册时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate register;

    /**
     * 注册资金
     */
    private Double capital;

    /**
     * 员工人数
     */
    private Integer staff;

    /**
     * 国税号
     */
    private String stateTax;

    /**
     * 地税号
     */
    private String localTax;

    /**
     * 开户银行
     */
    private String bank;

    /**
     * 银行账号
     */
    private String bankAccount;

    /**
     * 公司简介
     */
    private String introduction;

    /**
     * 公司地址
     */
    private String address;

    private static final long serialVersionUID = 1L;
}