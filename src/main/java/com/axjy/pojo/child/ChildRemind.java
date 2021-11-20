package com.axjy.pojo.child;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * kms_child_remind
 * @author 
 */
@Data
public class ChildRemind implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 幼儿id 引用档案学生信息表
     */
    private Long studentId;

    /**
     * 提醒时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate remindDate;

    /**
     * 便捷收费信息ID  便捷收费的外键
     */
    private Integer convenient;

    /**
     * 班级ID
     */
    private Integer classId;

    /**
     * 幼儿提醒内容
     */
    private String remindContent;

    /**
     * 由谁录入 当前操作员
     */
    private Integer createdBy;

    /**
     * 录入时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate creationDate;



    /*学生的姓名*/
    private String studentName;

    /*学生的学号*/
    private String studentCode;

    /*学生的班级*/
    private String className;

    /*状态*/
    private Integer status;


    /**
     * 隶属哪个园所
     */
    private Long gardenId;

    /*
     * 园所名称
     * */
    private String gardenName;

    /*
    * 录入人
    * */
    private String userName;


    private static final long serialVersionUID = 1L;
}