package com.axjy.controller.dayRegister;

import com.axjy.pojo.dayRegister.OurseAttendanceRecord;
import com.axjy.service.dayRegister.CourseCountService;
import com.axjy.utils.Result;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/attendance")
public class CurseCountController {

    @Resource
    private CourseCountService courseCountService;


    /**
     * 跳转考勤统计页面
     * @return
     */
    @GetMapping("/courseCount/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("attendance/courseCount/index");
        return modelAndView;
    }

    @GetMapping("/courseCount/search")
    public Result search(Integer page, Integer limit, OurseAttendanceRecord ourseAttendanceRecord){
        PageInfo pageInfo = courseCountService.findAll(page, limit, ourseAttendanceRecord);
        return Result.success(pageInfo);
    }

    @GetMapping("/courseCount/keshitongji")
    public Result tongji(){
        int zong = courseCountService.keshiozongji();
        Map<String,Object> map = new HashMap<>();
        map.put("zhong",zong);
        return Result.success(map);
    }

}
