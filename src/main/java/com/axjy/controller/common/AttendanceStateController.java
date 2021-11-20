package com.axjy.controller.common;


import com.axjy.pojo.AttendanceState;
import com.axjy.service.AttendanceStateService;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/sys/")
public class AttendanceStateController {
    @Resource
    private AttendanceStateService stateService;

    @GetMapping("/state/search")
    public Object gradeList(){
        List<AttendanceState> kmsGrades = stateService.find();
        return Result.success(kmsGrades,"查询成功！");
    }
}
