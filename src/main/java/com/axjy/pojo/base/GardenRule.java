package com.axjy.pojo.base;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_garden_rule
 * @author 
 */
@Data
public class GardenRule implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     *  出勤天数临界点
     */
    private Integer attendanceDays;

    /**
     * 1 是天 2 是%
     */
    private Integer lessUnit;

    /**
     * 1 按缺勤天数退还 2.按百分比退还 3.按出勤天数收取
     */
    private Integer lessChoice;

    /**
     * 第2个选项 按百分比退还比例数值
     */
    private Integer lessChoiceReturnRate;

    /**
     * 1 自定义出勤天数 2 固定22天 
     */
    private Integer attendanceRule;

    /**
     * 1 按出勤天数收费 2.固定22天取值
     */
    private Integer eatMoneyRule;

    /**
     * 所属园所
     */
    private String gardenId;

    private static final long serialVersionUID = 1L;
}