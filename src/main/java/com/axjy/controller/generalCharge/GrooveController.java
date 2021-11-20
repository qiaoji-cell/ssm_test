package com.axjy.controller.generalCharge;

import com.axjy.mapper.generalCharge.GrooveMapper;
import com.axjy.pojo.generalCharge.Groove;
import com.axjy.pojo.sys.User;
import com.axjy.service.generalCharge.GrooveService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.github.pagehelper.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Joe on 2021/11/02 上午 11:28
 */
@RestController
@RequestMapping("generalCharge")
public class GrooveController {
    @Resource
    private GrooveService grooveService;

    @GetMapping("/groove/list")
    public Result grooveList(Long gardenId, Long costCategory, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(user.getGarden_id()>0){
            gardenId = user.getGarden_id();
        }
        System.out.println(gardenId+"===带说明的费用==="+costCategory);
        List<Groove> list = grooveService.findAllWithDescByGardenId(gardenId,costCategory);
        return Result.success(list);
    }

    @GetMapping("/groove/otherList")
    public Result otherList(Long gardenId,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(user.getGarden_id()>0){
            gardenId = user.getGarden_id();
        }
       List<Groove> otherList = grooveService.findOtherFee(gardenId);
        return Result.success(otherList);
    }


}
