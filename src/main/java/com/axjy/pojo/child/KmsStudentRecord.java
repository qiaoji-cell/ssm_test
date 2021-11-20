package com.axjy.pojo.child;

import com.axjy.pojo.base.Class;
import com.axjy.pojo.recruit.Grade;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * kms_student_record
 * @author 
 */
@Data
public class KmsStudentRecord implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 学生编号
     */
    private String studentCode;

    /**
     * 学生姓名
     */
    private String studentName;

    /**
     * 学生性别
     */
    private Integer gender;

    /**
     * 出生日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate brithday;

    /**
     * 所属年级 引用所属年级
     */
    private Integer gradeId;

    /**
     * 所属班级
     */
    private Long classroomId;

    /**
     * 正式入园时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate enterDate;
    public LocalDate getEnterDate(){
        if(enterDate!=null){
            return enterDate.plusDays(1);
        }
        return enterDate;
    }

    /**
     * 离园时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime leaveDate;
    public LocalDateTime getLeaveDate() {
        if(leaveDate!=null){
            return leaveDate.plusDays(1);
        }
        return leaveDate;
    }
    /**
     * 状态 引用状态表
     */
    private Integer statusId;

    /**
     * 推荐人
     */
    private String recommender;

    /**
     * 招生顾问
     */
    private String adviserId;

    /**
     * 已有考勤 引用考勤表
     */
    private Integer attendanceId;

    /**
     * 家庭地址
     */
    private String address;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate createDate;
    public LocalDate getCreateDate() {
        if(createDate!=null){
            return createDate.plusDays(1);
        }
        return createDate;
    }

    /*所属园所*/
    private Long gardenId;

    /*所属园所名称*/
    private String gardenName;


    private Grade grade;


    private Class aClass;
    /**
    * 年级
    * */
    private String gradeName;
    /**
     * 班级
     * */
    private String className;

    /**
     * 状态
    * */
    private String statusName;

    private String picture;

    private static final long serialVersionUID = 1L;
}