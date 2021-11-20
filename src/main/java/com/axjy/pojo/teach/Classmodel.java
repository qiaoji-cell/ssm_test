package com.axjy.pojo.teach;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * kms_classmodel
 * @author 
 */
@Data
public class Classmodel implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 班型名称
     */
    private String gname;

    /**
     * 所属课程
     */
    private Long subjectId;

    /**
     * 课程数量
     */
    private Long classHour;

    /**
     * 应缴费用
     */
    private Double classCost;

    /**
     * 开始日期
     */
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
     * 授课老师
     */
    private Long classTeacher;

    /**
     * 备注
     */
    private String remark;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;

    /*
    * 课程名称
    * */
    private String gradeName;

    /*
    * userName 授课老师
    * */
    private String userName;

    /*
    * gardenName 所属园所
    * */
    private String gardenName;

    private static final long serialVersionUID = 1L;
}