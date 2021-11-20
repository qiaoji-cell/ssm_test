package com.axjy.pojo.generalCharge;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kms_groove
 * @author 
 */
@Data
public class Groove implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 费项名称
     */
    private String grooveName;

    /**
     * 引用费用类目表
     */
    private Integer costCategory;

    /**
     * 1 保育费 2.伙食费 3.其他费项
     */
    private Integer costType;

    /**
     * 收费单价
     */
    private Double univalence;

    /**
     * 收费方式 1.代表按学期、2.代表按月、3.代表按天
     */
    private Integer univalenceType;

    /**
     * 1 预付费 2.后付费(已【本月考勤】收本月保育费伙食费) 3.后付费(以【上月考勤】收本月保育费/伙食费)
     */
    private Integer payType;

    /**
     * 退费单价
     */
    private Double refund;

    /**
     * 单独打印 （0.代付否、1.代表是）
     */
    private Integer alone;

    /**
     * 整月缺勤时生成（0.代表否、1.代表是）
     */
    private Integer absence;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime createDate;

    /**
     * 费项说明
     */
    private String costRemark;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;

    private CostCategory category;

    private static final long serialVersionUID = 1L;
}