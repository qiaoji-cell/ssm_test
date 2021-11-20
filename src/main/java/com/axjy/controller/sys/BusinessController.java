package com.axjy.controller.sys;

import com.axjy.pojo.sys.Business;
import com.axjy.service.sys.BusinessService;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/17 下午 21:04
 */
@RestController
@RequestMapping("/base")
public class BusinessController {

    @Resource
    public BusinessService businessService;

    @GetMapping("/company/list")
    public Result companyIndex(){
        Business business = businessService.findById(1L);
        return Result.success(business,"查询成功了！");
    }

    @PostMapping("/company/update")
    public Result companyUpdate(Business business){
        try {
            businessService.updateComp(business);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("更新失败！");
        }
        return Result.success("更新成功！");
    }
}
