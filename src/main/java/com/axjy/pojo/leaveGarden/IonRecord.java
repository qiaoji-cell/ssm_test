package com.axjy.pojo.leaveGarden;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * kms_ion_record
 * @author 
 */
@Data
public class IonRecord implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 学号 引用学生表
     */
    private Long studentId;

    /**
     * 状态
     */
    private Integer state;

    /**
     * 离园时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate leavingDate;

    /**
     * 离园类型 1-幼儿退园 2-幼儿毕业 3-转园
     */
    private Integer leavingType;

    /**
     * 离园原因 1-家庭原因 2-对园所不满意 3-转入其他园所 4-幼儿不适
     */
    private Integer leavingCause;

    /**
     * 备注
     */
    private String remark;

    /**
     * 未确认收费
     */
    private Double collect;

    /**
     * 未确认退费
     */
    private Double premium;

    /**
     * 所属园所
     */
    private Long gardenid;

    /*
    * 幼儿编号
    * */
    private String studentCode;
    /*
    * 幼儿姓名
    * */
    private String studentName;
    /*
    * 所属班级
    * */
    private String className;
    /*
    * 入学时间
    * */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime enterDate;
    public LocalDateTime getEnterDate(){
        if(enterDate!=null){
            return enterDate.plusDays(1);
        }
        return enterDate;
    }

    /*
    * 园所名称
    * */
    private String gardenName;

    private static final long serialVersionUID = 1L;
}