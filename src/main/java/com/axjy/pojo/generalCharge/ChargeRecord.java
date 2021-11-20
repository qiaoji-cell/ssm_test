package com.axjy.pojo.generalCharge;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kms_charge_record
 * @author 
 */
@Data
public class ChargeRecord implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 学生外键
     */
    private Long studentId;

    /**
     * 学生姓名
     */
    private String studentName;

    /**
     * 学生编号
     */
    private String studentCode;

    /**
     * 学生性别
     */
    private Integer studentGender;

    /**
     * 年级名称
     */
    private String studentGardeName;

    /**
     * 年级id
     */
    private Long studentGardeId;

    /**
     * 班级名称
     */
    private String studentClassName;

    /**
     * 班级id
     */
    private Long studentClassId;

    /**
     * 其他费用开始日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime studentChargeStartDate;

    /**
     * 其他费用结束日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime studentChargeEndDate;

    /**
     * 费用类目
     */
    private String studentChargeCategoryName;

    /**
     * 费项名称
     */
    private String studentChargeGrooveName;

    /**
     * 费用类型 1.保育费 2.伙食费 3.其他费类
     */
    private Integer studentChargeCostType;

    /**
     * 按什么收费 1. 按学期，1.按月 1.按天
     */
    private Integer studentChargeUnivalenceType;

    /**
     * 收费价格
     */
    private Double studentChargeUnivalence;

    /**
     * 怎么付费1.预付费 2. 后付费本月考勤 3.后付费 上月考勤付本月
     */
    private Integer studentChargePayType;

    /**
     * 退费金额
     */
    private Double studentChargeRefund;

    /**
     * 是否单独打印
     */
    private Integer studentIsAlone;

    /**
     * 入园日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime studentEnterDate;

    /**
     * 园所id
     */
    private Integer studentGardenId;

    /**
     * 费用月份
     */
    @JsonFormat(pattern = "yyyy-MM")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime studentFeeDate;

    /**
     * 收费状态
     */
    private Integer studentState;

    private Integer page;
    private Integer limit;

    private static final long serialVersionUID = 1L;
}