package com.axjy.pojo.generalCharge;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_stu_record_eat_care
 * @author 
 */
@Data
public class StuRecordEatCare implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 档案学生记录表的学生id
     */
    private Long stuId;

    /**
     * 原来的伙食费id
     */
    private Long oldEatId;
    private String oldEat;

    /**
     * 原来的保育费id
     */
    private Long oldCareId;
    private String oldCare;

    /**
     * 现在的伙食费id
     */
    private Long nowEatId;
    private String nowEat;

    /**
     * 现在的保育费id
     */
    private Long nowCareId;
    private String nowCare;

    private String approvalChangeRemark;

    private Integer[] stuIds;

    private static final long serialVersionUID = 1L;
}