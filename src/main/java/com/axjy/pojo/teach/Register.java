package com.axjy.pojo.teach;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

/**
 * kms_register
 * @author 
 */
@Data
public class Register implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 学生id 引用学生表
     */
    private Long studentId;

    /**
     * 班级id 引用班级表
     */
    private Long classroomId;

    /*
    * 班型id 引用班型表
    * */
    private Long classModelId;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate startDate;

    /**
     * 结束日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate endDate;

    /**
     * 实缴费用
     */
    private Double paidin;

    /**
     * 说明
     */
    private String explaIn;

    /*
    * 学生学号
    * */
    private String studentCode;



    /*
    * 学生姓名
    * */
    private String studentName;

    /*
    * 班级名称
    * */
    private String className;

    /*
    * 课程数量
    * */
    private Long classHour;

    /*
    * 所属园所
    * */
    private String gardenName;

    private static final long serialVersionUID = 1L;
}