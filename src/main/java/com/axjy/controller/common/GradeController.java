package com.axjy.controller.common;

import com.axjy.pojo.recruit.Grade;
import com.axjy.pojo.sys.User;
import com.axjy.service.recruit.GradeService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Joe on 2021/10/14 下午 18:07
 */
@RestController
@RequestMapping("/sys/")
public class GradeController {
    @Resource
    private GradeService kmsService;
   @GetMapping("/grade/list")
    public Object gradeList(Long gardenId,HttpSession session){
       User user  = (User) session.getAttribute(Constants.USER_SESSION);
       if(user.getGarden_id()>0){
           gardenId=user.getGarden_id();
       }
       List<Grade> grades = kmsService.findAllGrade(gardenId);
       return Result.success(grades,"查询成功！");
   }

}
