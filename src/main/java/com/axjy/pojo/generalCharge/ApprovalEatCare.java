package com.axjy.pojo.generalCharge;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * kms_approval_eat_care
 * @author 
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApprovalEatCare implements Serializable {
    private Long approvalId;

    /**
     * 审批学生的id 申请后插入 
     */
    private Long approvalStuId;

    /**
     * 要审批的变更表id
     */
    private Long approvalChangeRecord;

    /**
     * 变更说明
     */
    private String approvalChangeRemark;

    /**
     * 申请人 操作人id
     */
    private Long approvalProposer;

    /**
     * 审批状态 1,待审批 2.已审批 3.已驳回
     */
    private Integer approvalState;

    /**
     * 待审批人  从拥有审批角色的用户查询拼接成字符串
     */
    private String approvalPerson;

    /**
     * 申请时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime applyDatetime;

    private Integer[] stuIds;

    private static final long serialVersionUID = 1L;
}