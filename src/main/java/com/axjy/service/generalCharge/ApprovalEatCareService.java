package com.axjy.service.generalCharge;

import com.axjy.pojo.generalCharge.ApprovalEatCare;

/**
 * Created by Joe on 2021/11/02 下午 02:33
 */
public interface ApprovalEatCareService {
    //添加审批记录
    void addApprovalEatCare(ApprovalEatCare eatCare);

    //修改审批记录 通过学生id
    void upApprovalEatCareByStuId(ApprovalEatCare eatCare);

    //通过学生id查找
    Integer findByApprovalStuId(Long stuId);

    //修改申请状态 2 通过 3 驳回
    void updateState(Long[] stuIds,Long state);
}