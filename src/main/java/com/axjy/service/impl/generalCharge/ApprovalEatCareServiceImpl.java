package com.axjy.service.impl.generalCharge;

import com.axjy.mapper.generalCharge.ApprovalEatCareMapper;
import com.axjy.mapper.generalCharge.StuRecordEatCareMapper;
import com.axjy.pojo.generalCharge.ApprovalEatCare;
import com.axjy.service.generalCharge.ApprovalEatCareService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/11/02 下午 02:35
 */
@Service("approvalEatCareService")
public class ApprovalEatCareServiceImpl implements ApprovalEatCareService {
    @Resource
    private ApprovalEatCareMapper approvalEatCareMapper;
    @Resource
    private StuRecordEatCareMapper stuRecordEatCareMapper;
    @Override
    public void addApprovalEatCare(ApprovalEatCare eatCare) {
        System.out.println("要添加的审批："+eatCare);
        approvalEatCareMapper.insertSelective(eatCare);
    }

    @Override
    public void upApprovalEatCareByStuId(ApprovalEatCare eatCare) {

        approvalEatCareMapper.upByStuId(eatCare);
    }

    @Override
    public Integer findByApprovalStuId(Long stuId) {
        return approvalEatCareMapper.findByStuId(stuId);
    }

    @Override
    public void updateState(Long[] stuIds, Long state) {
        if(state==2){
            //更改伙食费、保育费记录的 变更 到现有
            stuRecordEatCareMapper.updateOldToNow(stuIds);
        }
        approvalEatCareMapper.updateState(stuIds,state);
    }


}
