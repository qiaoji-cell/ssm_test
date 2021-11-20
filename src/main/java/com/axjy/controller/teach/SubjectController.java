package com.axjy.controller.teach;

import com.axjy.pojo.sys.User;
import com.axjy.pojo.teach.Subject;
import com.axjy.service.teach.SubjectService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/subject")
public class SubjectController {
    @Resource
    private SubjectService subjectService;

    @GetMapping("/search")
    public Result search(HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        System.out.println(getGardenId+"登录人id");
        List<Subject> list =  subjectService.find(getGardenId);
        return Result.success(list,"查询成功！");
    }



}
