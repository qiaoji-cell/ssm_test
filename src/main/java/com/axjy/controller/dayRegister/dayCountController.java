package com.axjy.controller.dayRegister;

import com.axjy.pojo.dayRegister.AttendanceRecord;
import com.axjy.service.dayRegister.AttendanceRecordService;
import com.axjy.utils.Result;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/attendance")
public class dayCountController {

    @Resource
    private AttendanceRecordService attendanceRecordService;

    /**
     * 跳转考勤统计页面
     * @return
     */
    @GetMapping("/dayCount/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("attendance/dayCount/index");
        return modelAndView;
    }

    /**
     * 考勤统计
     * 分页
     * 条件查询
     * @param page
     * @param limit
     * @param attendanceRecord
     * @return
     */
    @GetMapping("/dayCount/search")
    public Result search(Integer page, Integer limit, AttendanceRecord attendanceRecord){
        PageInfo pageInfo = attendanceRecordService.findAll(page, limit,attendanceRecord);
        return  Result.success(pageInfo);
    }

    /**
     * 考勤统计在园人数
     * @return
     */
    @GetMapping("/dayCount/zyrs")
    public Result zyrs(){
        Integer zyrs = attendanceRecordService.zyrs();
        Map<String,Object> map = new HashMap<>();
        map.put("zyrs",zyrs);
        return Result.success(map);
    }

    /**
     * 考勤统计不在园人数
     * @return
     */
    @GetMapping("/dayCount/bzyrs")
    public Result bzyrs(){
        Integer bzyrs = attendanceRecordService.bzyrs();
        Map<String,Object> map = new HashMap<>();
        map.put("bzyrs",bzyrs);
        return Result.success(map);
    }

    /**
     * 考勤统计病假总次数
     * @return
     */
    @GetMapping("/dayCount/bingjia")
    public Result bingjia(){
        Integer bingjia = attendanceRecordService.bingjia();
        Map<String,Object> map = new HashMap<>();
        map.put("bingjia",bingjia);
        return Result.success(map);
    }

    /**
     * 考勤统计事假
     * @return
     */
    @GetMapping("/dayCount/shijia")
    public Result shijia(){
        Integer shijia = attendanceRecordService.shijia();
        Map<String,Object> map = new HashMap<>();
        map.put("bingjia",shijia);
        return Result.success(map);
    }

    /**
     * 考勤统计总人数
     * @return
     */
    @GetMapping("/dayCount/zongrenshu")
    public Result zongrenshu(){
        Integer zongrenshu = attendanceRecordService.zongrenshu();
        Map<String,Object> map = new HashMap<>();
        map.put("zongrenshu",zongrenshu);
        return Result.success(map);
    }

    @GetMapping("/dayCount/query")
    public Result query(String date){
        List<AttendanceRecord> list = attendanceRecordService.querydatatime(date);
        return Result.success(list);
    }



}
