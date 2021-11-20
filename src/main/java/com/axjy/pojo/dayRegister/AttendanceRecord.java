package com.axjy.pojo.dayRegister;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * kms_attendance_record
 * @author 
 */
@Data
public class AttendanceRecord implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 考勤月份
     */
    @JsonFormat(pattern = "yyyy-MM")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime inattendance;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String willIntoDateStart;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String willIntoDateEnd;

    /**
     * 班级(引用班级表班级列 ）1.托一班、2.小一班、3.小二班、4.中一班、5.中二班、6.大一班
     */
    private Integer classid;

    /**
     * 班级
     */
    private String className;

    /**
     * 学号
     */
    private String stunumber;

    /**
     * 姓名
     */
    private String name;

    /**
     * 已签
     */
    private Integer signed;

    /**
     * 事假
     */
    private Integer leaver;

    /**
     * 病假
     */
    private Integer sickleave;

    /**
     * 占床
     */
    private Integer occupiedbed;

    /**
     * 未登记
     */
    private Integer unregistered;

    /**
     * 未入园
     */
    private Integer notpark;

    /**
     * 节假日
     */
    private Integer vacation;

    /**
     * 星期几
     */
    private String Sunday;

    /**
     * 状态
     */
    private Integer reason;



    private static final long serialVersionUID = 1L;
}