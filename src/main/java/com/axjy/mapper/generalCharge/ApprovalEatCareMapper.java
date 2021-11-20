package com.axjy.mapper.generalCharge;

import com.axjy.pojo.generalCharge.ApprovalEatCare;
import org.apache.ibatis.annotations.Param;

public interface ApprovalEatCareMapper {
    //更新指定学生审批伙食费、保育费审批状态
    void updateState(@Param("stuIds")Long[] stuIds,@Param("state")Long state);
    //通过学生id查找
    Integer findByStuId(Long stuId);
    //批量添加审批记录
    void batchInsert(@Param("eatCare") ApprovalEatCare eatCare);
    //更改状态
    void upByStuId(ApprovalEatCare eatCare);

    int deleteByPrimaryKey(Long approvalId);

    int insert(ApprovalEatCare record);

    int insertSelective(ApprovalEatCare record);

    ApprovalEatCare selectByPrimaryKey(Long approvalId);

    int updateByPrimaryKeySelective(ApprovalEatCare record);

    int updateByPrimaryKey(ApprovalEatCare record);
}