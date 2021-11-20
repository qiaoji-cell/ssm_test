package com.axjy.controller.recruit;

import com.axjy.pojo.recruit.Student;
import com.axjy.pojo.sys.User;
import com.axjy.service.recruit.StudentService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.recruit.CountVo;
import com.github.pagehelper.PageInfo;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Joe on 2021/10/12 下午 16:37
 */
@RestController
@RequestMapping("/recruit")
public class CountController {
    @Resource
    private StudentService studentService;

    @GetMapping("/count/index")
    public ModelAndView index(){
        return new ModelAndView("recruit/count/index");
    }

    @GetMapping("/count/list")
    public Result list(CountVo countVo, Student student, Model model, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        countVo.setGardenId(getGardenId);
        PageInfo pageInfo = studentService.findAllStudent(countVo,student);
        return Result.success(pageInfo);
    }











}
