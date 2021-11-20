package com.axjy.controller.teach;

import com.axjy.pojo.sys.User;
import com.axjy.service.sys.UserService;
import com.axjy.utils.Result;
import com.axjy.vo.sys.QueryUserVo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/registerUser")
public class UserFindController {

    @Resource
    private UserService userService;

    @GetMapping("/search")
    public Result search(QueryUserVo vo){
        System.out.println(vo+"aaaaaaaaaaaavo");
        List<User> list =  userService.findUser(vo);
        System.out.println(list+"------------list");
        return Result.success(list,"查询成功！");
    }
}
