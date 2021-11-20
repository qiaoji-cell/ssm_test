package com.axjy.controller.sys;

import com.axjy.pojo.sys.User;
import com.axjy.pojo.sys.UserLog;
import com.axjy.service.sys.UserLogService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.log.LogQueryVo;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by Joe on 2021/10/26 下午 17:50
 */
@RestController
@RequestMapping("/sys")
public class LogController {
    @Resource
    private UserLogService userLogService;

    @GetMapping("/log/index")
    public ModelAndView logIndex(){
        return new ModelAndView("sys/user/log");
    }

    @GetMapping("/log/list")
    public Result logList(LogQueryVo vo){
        return Result.success(userLogService.findAllLog(vo));
    }

    @PostMapping("/log/add")
    public Result logAdd(UserLog log, HttpSession httpSession){
        System.out.println(log);
        try {
            User user = (User) httpSession.getAttribute(Constants.USER_SESSION);
            log.setUserCode(user.getUser_code());

            LocalDateTime dateTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            log.setUserName(user.getUserName());
            //保存到数据库的为日期对象
            log.setLoginDate(dateTime);
            //session对象记录登录时间 页面对象用户String展示
            user.setLoginTime(dateTime.format(formatter));
            httpSession.setAttribute(Constants.USER_SESSION,user);
            System.out.println("展示在页面上的用户："+user);
            userLogService.addLog(log);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("添加记录失败！");
        }
        return Result.success("添加记录成功！");
    }
}
