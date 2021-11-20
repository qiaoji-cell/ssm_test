package com.axjy.controller.recruit;

import com.axjy.pojo.recruit.Student;
import com.axjy.pojo.sys.User;
import com.axjy.service.recruit.StudentService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/recruit")
public class TongJiController {

    @Resource
    private StudentService studentService;

    /**
     * 招生统计幼儿总人数
     * @return
     */
    @GetMapping("/input/rs")
    public Result tongji(Student studentu, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        studentu.setGardenId(getGardenId);
        int zong = studentService.zongrenshu(studentu);
        Map<String,Object> map = new HashMap<>();
        map.put("zhong",zong);
        return Result.success(map);
    }

    /**
     * 招生统计金额总和
     */
    @GetMapping("/input/zh")
    public Result zonghe(Student studentu, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        studentu.setGardenId(getGardenId);
        int zonghe = studentService.moneyhe(studentu);
        Map<String,Object> map = new HashMap<>();
        map.put("zonghe",zonghe);
        return Result.success(map);
    }

    /**
     * 招生统计已退费总和
     */
    @GetMapping("/input/tf")
    public Result tuifei(Student studentu, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        studentu.setGardenId(getGardenId);
        int tuifei = studentService.tuifeizonghe(studentu);
        Map<String,Object> map = new HashMap<>();
        map.put("tuifei",tuifei);
        return Result.success(map);
    }

    /**
     * 招生统计幼儿入园人数总和
     */
    @GetMapping("/input/ry")
    public Result ruyuan(Student studentu, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        studentu.setGardenId(getGardenId);
        int ruyuan = studentService.ruyuan(studentu);
        Map<String,Object> map = new HashMap<>();
        map.put("ruyuan",ruyuan);
        return Result.success(map);
    }

    /**
     * 招生统计幼儿园的未退费
     */
    @GetMapping("/input/wtf")
    public Result weituifei(Student studentu, HttpSession session) {
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        studentu.setGardenId(getGardenId);
        int weituifei = studentService.weituifei(studentu);
        Map<String,Object> map = new HashMap<>();
        map.put("weituifei",weituifei);
        return Result.success(map);
    }




}
