package com.axjy.pojo.recruit;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * kms_student
 * @author 
 */
@Data
public class Student implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 学生姓名
     */
    private String studentname;

    /**
     * 学生编号
     */
    private String studentCode;

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
     * 收费类型 引用收费类型表
     */
    private Integer chargetype;

    /**
     * 定班日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate setclassDate;
    public LocalDate getSetclassDate(){
        if(setclassDate!=null){
            return setclassDate.plusDays(1);
        }
        return setclassDate;
    }

    /**
     * 缴费金额
     */
    private Double chargeamount;

    /**
     * 预计入园时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate willIntoDate;
    public LocalDate getWillIntoDate(){
        if(willIntoDate!=null){
            return willIntoDate.plusDays(1);
        }
        return willIntoDate;
    }

    /**
     * 手机号
     */
    private String phone;

    /**
     * 定班家长
     */
    private String setclassParents;

    /**
     * 定班教师 当前登录用户
     */
    private String setclassTeacher;

    /**
     * 定班票号
     */
    private String setclassTicketno;

    /**
     * 是否入园
     */
    private Integer intoKindergarten;

    /**
     * 附件
     */
    private String attache;

    /**
     * 照片信息
     */
    private String pictrue;

    /**
     * 是否退费
     */
    private Integer isreturn;

    /**
     * 退费类型
     */
    private String returntype;

    /**
     * 退费日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate returndate;
    public LocalDate getReturndate() {
        if(returndate!=null){
            return returndate.plusDays(1);
        }
        return returndate;
    }

    /**
     * 退款方式
     */
    private Integer returnway;

    /**
     * 说明
     */
    private String remark;

    /**
     * 创建人
     */
    private String createdBy;

    private Grade grade;

    /**
     * 所属年级
     */
    private String gradeName;

    private Long gardenId;
    /**
     * 所诉园所
     */
    private String gardenName;

    private static final long serialVersionUID = 1L;
}