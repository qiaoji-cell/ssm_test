package com.axjy.pojo.dayRegister;

import lombok.Data;

import java.io.Serializable;

/**
 * kms_attendance
 * @author 
 */
@Data
public class Attendance implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 学生编号
     */
    private Integer studentId;

    /**
     * 考勤状态 引用签到状态表
     */
    private Long attendanceState;

    /**
     * 登记人
     */
    private String registrant;

    /**
     * 考勤锁定（1.否、2.是
     */
    private Integer attendanceLock;

    /**
     * 学号
     */
    private String studentCode;
    /**
     * 学生姓名
     */
    private String studentname;
    /**
     * 学生性别
     */
    private Integer gender;
    /**
     * 收费类型  业主等
     */
    private String chargeType;
    /**
     * 家庭住址
     */
    private String homeAddress;
    /**
     * 关系名称
     */
    private String relationName;

    /**
     * 个人手机号
     */
    private String phone;
    /**
     * 班级
     */
    private String className;


    private static final long serialVersionUID = 1L;
}