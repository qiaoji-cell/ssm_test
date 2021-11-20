package com.axjy.controller.common;

import com.axjy.pojo.ChargeType;
import com.axjy.service.ChargeTypeService;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/sys")
public class ChargeTypeController {


    @Resource
    private ChargeTypeService chargeTypeService;


    @GetMapping("/chargeType/list")
    public Result chargeTypeMapper(){
        List<ChargeType> chargeTypeList = chargeTypeService.findAll();
        return Result.success(chargeTypeList);
    }


}
