package com.axjy.pojo.dayRegister;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * kms_ourse_attendance_record
 * @author 
 */
@Data
public class OurseAttendanceRecord implements Serializable {
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String willIntoDateStart;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String willIntoDateEnd;
    /**
     * 编号
     */
    private Long id;

    /**
     * 学生性别等信息 引用 学生表
     */
    private Long studentId;

    /**
     * 课程表相关信息 引用班型课程表
     */
    private Long courseId;

    /**
     * 考勤状态（1.正常、2.暂停）
     */
    private Integer attendanceState;

    /**
     * 考勤日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime attendanceDate;

    /**
     * 本次考勤使用课时
     */
    private Integer useCoursetime;

    /**
     * 由谁创建
     */
    private Long createdBy;

    /**
     * 考勤类型
     */
    private Integer attendanceType;

    /**
     * 考勤备注
     */
    private Long remark;

    /**
     * 学生姓名
     */
    private String studentName;

    /**
     * 学生性别
     */
    private Integer gender;

    /**
     * 班级名称
     */
    private String className;

    /**
     * 监护人关系
     */
    private String relationName;

    /**
     * 监护人电话
     */
    private String phone;

    /**
     * 班型
     */
    private String gName;

    /**
     * 学号
     */
    private String studentcode;

    private static final long serialVersionUID = 1L;
}