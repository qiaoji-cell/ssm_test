package com.axjy.controller.generalCharge;

import com.axjy.service.child.StudentRecordService;
import com.axjy.utils.Result;
import com.axjy.vo.generalCharge.FeeWithVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/11/01 下午 07:19
 */
@RestController
@RequestMapping("/generalCharge")
public class ChildWithFeeController {

    @Resource
    private StudentRecordService studentRecordService;

    @GetMapping("/normal/list")
    public Result otherList(FeeWithVo vo){
        if(vo.getGardenId()==null){
            vo.setGardenId(1L);
        }
        return Result.success(studentRecordService.findAllFeeWith(vo));
    }

    @GetMapping("/normal/waitList")
    public Result waitList(FeeWithVo vo){
        vo.setApprovalState(1);
        return Result.success(studentRecordService.findAllFeeWith(vo));
    }
}
