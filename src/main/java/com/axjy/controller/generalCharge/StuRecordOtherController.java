package com.axjy.controller.generalCharge;

import com.axjy.pojo.sys.User;
import com.axjy.service.generalCharge.StuRecordOtherService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.other.OtherFeeVo;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Joe on 2021/11/03 下午 11:16
 */
@RestController
@RequestMapping("generalCharge")
@Transactional
public class StuRecordOtherController {
    @Resource
    private StuRecordOtherService stuRecordOtherService;
    @PostMapping("/other/add")
    public Result add(@RequestBody OtherFeeVo vo){
        System.out.println(vo+"===");
//        OtherFeeDate se = new OtherFeeDate();
        System.out.println("开始截止日期："+vo);
        try {
            stuRecordOtherService.addRecord(vo.getGardenId(),vo.getClassId(),vo.getIds(),vo);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.success("修改失败！");
        }
        return Result.success("批量添加成功！");
    }
    @PostMapping("/other/singleAdd")
    public Result singleAdd(@RequestBody OtherFeeVo vo){
        //========================Long gardenId,Long stuId,Long[] costIds,OtherFeeVo se=======================
        try {
            stuRecordOtherService.addSingleRecord(vo.getGardenId(),vo.getStuId(),vo.getIds(),vo);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("添加失败");
        }
        return Result.success("添加成功！");
    }

    @PostMapping("/other/up")
    public Result up(@RequestBody OtherFeeVo vo, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(user.getGarden_id()>0){
            vo.setGardenId(user.getGarden_id());
        }

        try {
            stuRecordOtherService.upRecord(vo.getGardenId(),vo.getClassId(),vo.getIds(),vo);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.success("修改失败！");
        }
        return Result.success("批量修改成功！");
    }

    @GetMapping("/other/have")
    public Result have(Long stuId){
        return Result.success(stuRecordOtherService.findAllByStuId(stuId));
    }

    @GetMapping("/other/noHave")
    public Result noHave(Long gardenId,Long stuId,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(user.getGarden_id()>0){
            gardenId = user.getGarden_id();
        }
        return Result.success(stuRecordOtherService.findAllNoByStuId(gardenId,stuId));
    }

    @PostMapping("/other/del")
    public Result del(Long stuId,Long[] ids){
        try {
            stuRecordOtherService.batchDel(stuId,ids);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("删除失败！联系管理员");
        }
       return  Result.success("删除成功！");
    }
}
