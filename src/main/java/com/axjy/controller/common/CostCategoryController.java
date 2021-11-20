package com.axjy.controller.common;

import com.axjy.service.generalCharge.CostCategoryService;
import com.axjy.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/31 上午 09:03
 */
@RestController
@RequestMapping("common")
public class CostCategoryController {
    @Resource
    private CostCategoryService costCategoryService;
    @GetMapping("/cost/Category")
    public Result costCategory(){
        return Result.success(costCategoryService.findAll());
    }
}
