package com.axjy.pojo.teach;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * kms_attend_class
 * @author 
 */
@Data
public class AttendClass implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 教室id 外键教室表
     */
    private Long classroomId;

    /**
     * 班型id 外键班型表
     */
    private Long classmodelId;

    /**
     * 用户id 也是老师id 外键用户表
     */
    private Long userId;

    /**
     * 课时数
     */
    private Long hours;

    /**
     * 说明
     */
    private String explaIn;

    /**
     * 上课时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate timeClass;

    /*
    * 教室名称
    * */
    private String gradeName;

    /*
    * 用户名称
    * */
    private String userName;

    private static final long serialVersionUID = 1L;
}