package com.axjy.controller.common;

import com.axjy.pojo.base.Class;
import com.axjy.pojo.sys.User;
import com.axjy.service.common.ClassService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.generalCharge.AboutVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/sys/")
@Slf4j
public class ClassController {
    @Resource
    private ClassService classService;

    /**
     * 批量调班用到的班级列表 只通过会话用户的id查询 管理员管理的功能阉割掉了 如果加的话，也是一个下拉里列表
     * @param session 获取会话用户的园所信息
     * @return 指定园所的班级列表
     */
    @GetMapping("class/batchList")
    public Object gradeList(HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        System.out.println("查询班级："+user.getGarden_id());
        List<Class> kmsGrades = classService.find(user.getGarden_id());
        return Result.success(kmsGrades,"查询成功！");
    }


    @GetMapping("class/treeList")
    public Object treeList(Long gardenId,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(user.getGarden_id()>0){
            gardenId=user.getGarden_id();
        }
        System.out.println("查询班级："+user.getGarden_id());
        List<AboutVo> kmsGrades = classService.findWithChild(gardenId);

        System.out.println("查询的年级："+kmsGrades);
        return Result.success(kmsGrades,"查询成功！");
    }



    /**
     * 根据园所id 获取指定园所班级列表
     * @param gardenId 园所id
     * @return 班级列表
     */
    @GetMapping("class/list")
    public Object gradeList(Long gardenId,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(user.getGarden_id()>0){
            gardenId=user.getGarden_id();
        }
        List<Class> kmsGrades = classService.find(gardenId);
        return Result.success(kmsGrades,"查询成功！");
    }

}
