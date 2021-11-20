package com.axjy.pojo.child;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_student_matter
 * @author 
 */
@Data
public class StudentMatter implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 学生编号 外键档案表
     */
    private String studentCode;

    /**
     * 是否独生 1是 0否
     */
    private Integer isonly;

    /**
     * 户籍类型 1本市 2本省 3外省 4外籍
     */
    private String householdType;

    /**
     * 户籍所在地
     */
    private String householdLocation;

    /**
     * 出生所在地
     */
    private String birthLocation;

    /**
     * 籍贯
     */
    private String nativePlace;

    /**
     * 家庭住址
     */
    private String address;

    /**
     * 证件号码
     */
    private String certificatesNumber;

    /**
     * 健康状况
     */
    private String health;

    /**
     * 害怕的事情
     */
    private String fearThings;

    /**
     * 忌食
     */
    private String avoid;

    /**
     * 过敏
     */
    private String allergy;

    /**
     * 兴趣爱好
     */
    private String hobby;

    /**
     * 特殊照顾
     */
    private String special;

    /**
     * 备注
     */
    private String remarks;

    private static final long serialVersionUID = 1L;
}