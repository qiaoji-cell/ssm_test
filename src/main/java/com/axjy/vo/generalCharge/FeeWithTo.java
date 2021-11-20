package com.axjy.vo.generalCharge;

import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.pojo.generalCharge.ApprovalEatCare;
import com.axjy.pojo.generalCharge.StuRecordEatCare;
import lombok.Data;

/**
 * Created by Joe on 2021/11/01 下午 05:57
 */
@Data
public class FeeWithTo extends KmsStudentRecord {

    private ApprovalEatCare approvalEatCare;
    /**
     * 变更的伙食费id
     */
    private String oldEat;

    /**
     * 变更的保育费id
     */
    private String oldCare;

    /**
     * 现在的伙食费id
     */
    private String nowEat;

    /**
     * 现在的保育费id
     */
    private String nowCare;

    private String userName;

    //状态 离园 在园 毕业
    private String statusName;

    //变更说明
    private String approvalChangeRemark;
}
