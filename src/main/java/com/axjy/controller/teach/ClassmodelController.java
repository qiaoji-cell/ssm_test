package com.axjy.controller.teach;

import com.axjy.pojo.sys.User;
import com.axjy.pojo.teach.Classmodel;
import com.axjy.service.teach.ClassmodelService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.teach.ClassmodelVo;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/classModel")
public class ClassmodelController {
    @Resource
    private ClassmodelService classmodelService;
    @GetMapping("/search")
    private Result search(Integer page, Integer limit, ClassmodelVo classmodelVo, HttpSession session){

        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        System.out.println(classmodelVo+"传过来的vo-----------");
        if (getGardenId>0){
            classmodelVo.setGardenId(getGardenId);
        }
        PageInfo pageInfo  = classmodelService.searchPage(page,limit,classmodelVo);
        return Result.success(pageInfo);
    }
    @PostMapping("/insert")
    private Result insert(Classmodel classmodel,HttpSession session){
        System.out.println(classmodel+"控制器的数据");
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long gardenId =  user.getGarden_id();
        classmodel.setGardenId(gardenId);
        classmodelService.insert(classmodel);
        return  Result.success("增加成功！");
    }
    @PostMapping("/update")
    private Result update(Classmodel classmodel,HttpSession session){
        System.out.println(classmodel+"修改---------控制器的数据");
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long gardenId =  user.getGarden_id();
        classmodel.setGardenId(gardenId);
        classmodelService.update(classmodel);
        return  Result.success("修改成功！！");
    }


}
