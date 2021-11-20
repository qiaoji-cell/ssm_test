package com.axjy.controller.generalCharge;

import com.axjy.pojo.generalCharge.ApprovalEatCare;
import com.axjy.pojo.generalCharge.StuRecordEatCare;
import com.axjy.pojo.sys.User;
import com.axjy.service.generalCharge.ApprovalEatCareService;
import com.axjy.service.generalCharge.StuRecordEatCareService;
import com.axjy.service.sys.UserService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Created by Joe on 2021/11/02 下午 02:30
 */
@RestController
@RequestMapping("generalCharge")
@Transactional
public class StuRecordEatCareController {

    @Resource
    private StuRecordEatCareService stuRecordEatCareService;
    @Resource
    private ApprovalEatCareService approvalEatCareService;
    @Resource
    private UserService userService;

    @PostMapping("/eatCare/add")
    public Result change(StuRecordEatCare record, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        System.out.println(record);
        try {
            for (int i = 0; i <record.getStuIds().length; i++) {
                System.out.println("所有的id"+(record.getStuIds()[i]));
                Integer stuId = record.getStuIds()[i];

                record.setStuId(Long.parseLong(String.valueOf(stuId)));

                //有审批记录进行更新
                if(approvalEatCareService.findByApprovalStuId(Long.parseLong(String.valueOf(stuId)))>0){
                    //审批伙食费、保育费变更表
                    ApprovalEatCare eatCare = new ApprovalEatCare();
                    eatCare.setApprovalChangeRemark(record.getApprovalChangeRemark());
                    //变更学生
                    eatCare.setStuIds(new Integer[]{record.getStuIds()[i]});
                    eatCare.setApprovalStuId(Long.parseLong(String.valueOf(stuId)));
                    //申请人
                    eatCare.setApprovalProposer(Long.parseLong(String.valueOf(user.getId())));
                    //申请时间
                    eatCare.setApplyDatetime(LocalDateTime.now());
                    //设定为待审批
                    eatCare.setApprovalState(1);
                    //待审批人
                    eatCare.setApprovalPerson(userService.findApprovalPerson());
                    //说明
                    if(eatCare.getApprovalChangeRemark()==null){
                        eatCare.setApprovalChangeRemark("");
                    }
                    approvalEatCareService.upApprovalEatCareByStuId(eatCare);
                }else{
                    //审批伙食费、保育费变更表
                    ApprovalEatCare eatCare = new ApprovalEatCare();
                    //学生id
                    eatCare.setApprovalStuId(Long.parseLong(String.valueOf(stuId)));

                    eatCare.setApprovalChangeRemark(record.getApprovalChangeRemark());
                    //变更学生
                    eatCare.setStuIds(new Integer[]{record.getStuIds()[i]});
                    //申请人
                    eatCare.setApprovalProposer(Long.parseLong(String.valueOf(user.getId())));
                    //申请时间
                    eatCare.setApplyDatetime(LocalDateTime.now());
                    //设定为待审批
                    eatCare.setApprovalState(1);
                    //待审批人
                    eatCare.setApprovalPerson(userService.findApprovalPerson());
                    //说明
                    if(eatCare.getApprovalChangeRemark()==null){
                        eatCare.setApprovalChangeRemark("");
                    }
                    //没有记录添加审批记录
                    approvalEatCareService.addApprovalEatCare(eatCare);
                }
                //有伙食变更记录 更新 没有添加
                if(stuRecordEatCareService.countByStuId(Long.parseLong(String.valueOf(stuId)))>0){
                    //========================更新=======================
                    stuRecordEatCareService.upRecord(record);
                }else{
                    //========================添加记录=======================
                    stuRecordEatCareService.addRecord(record);

                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            return Result.success("申请失败！");
        }

        return Result.success("提交成功！请等待审批通过后才能生效！");
    }



    @PostMapping("eatCare/update")
    public Result update(Long[] stuIds,Long state){
        try {
            approvalEatCareService.updateState(stuIds,state);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("审批失败！请联系管理员！");
        }
        return Result.success("审批通过成功!");
    }



}
