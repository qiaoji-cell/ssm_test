package com.axjy.controller.dayRegister;


import com.axjy.pojo.dayRegister.Attendance;
import com.axjy.service.dayRegister.AttendanceService;
import com.axjy.utils.Result;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/attendance")
public class dayRegisterController {


    @Resource
    private AttendanceService attendanceService;


    /**
     * 跳转考勤登记页面
     * @return
     */
    @GetMapping("/dayRegister/index")
    public ModelAndView index(){
      ModelAndView modelAndView = new ModelAndView("attendance/dayRegister/index");
      return modelAndView;
    }

    /**
     * 分页
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/dayRegister/search")
    public Result search(Integer page, Integer limit,String className){
        PageInfo pageInfo = attendanceService.findAll(page, limit,className);
        return  Result.success(pageInfo);
    }

    /**
     * 考勤状态已签
     * @param id
     * @return
     */
    @PostMapping("/dayRegister/upState")
    public Result userUpState(Long id){
        try {
            attendanceService.updateState(id);
            return Result.success("已签成功");

        }catch (Exception ex){
            String msg = "已签失败";
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }

    /**
     * 考勤状态未签
     * @param id
     * @return
     */
    @PostMapping("/dayRegister/upState2")
    public Result userUpState2(Long id){
        try {
            attendanceService.updateState2(id);
            return Result.success("未签成功");
        }catch (Exception ex){
            String msg = "未签失败";
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }

    /**
     * 考勤已锁定
     * @param id
     * @return
     */
    @PostMapping("/dayRegister/upyisuo")
    public Result upyisuo(Long id){
        try {
            attendanceService.updateyisuo(id);
            return Result.success("锁定成功");
        }catch (Exception ex){
            String msg = "锁定失败";
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }

    /**
     * 考勤已锁定
     * @param id
     * @return
     */
    @PostMapping("/dayRegister/upweisuo")
    public Result upweisuo(Long id){
        try {
            attendanceService.updateweisuo(id);
            return Result.success("取消锁定成功");
        }catch (Exception ex){
            String msg = "取消锁定失败";
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }

    /**
     *请假
     * @param attendance
     * @return
     */
    @PostMapping("/dayRegister/upq")
    public Result upqj(Attendance attendance){
        try {
            attendanceService.upqj(attendance);
            return Result.success("请假成功");
        }catch (Exception ex){
            String msg = "请假失败";
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }

    /**
     * 按钮签到
     * @param id
     * @return
     */
    @PostMapping("dayRegister/qjup")
    public Result qjup(Long id){
        try {
            attendanceService.ztqj(id);
            return Result.success("签到成功");
        }catch (Exception ex){
            String msg = "签到失败";
            log.error(msg,ex);
            return Result.failed(msg);
        }
    }

    /**
     * 批量签到
     * @param ids
     * @return
     */
    @PostMapping("dayRegister/plqj")
    public Result plqd(@RequestBody Integer[] ids){
        try {
            attendanceService.plqj(ids);
            return Result.success("签到成功");
        }catch (Exception ex){
            String msg = "签到失败";
            log.error(msg,ex);
            return Result.failed(msg);
        }
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @PostMapping("dayRegister/pldel")
    public Result pldel(@RequestBody Integer[] ids){
        try {
            attendanceService.del(ids);
            return Result.success("删除成功");
        }catch (Exception ex){
            String msg = "删除失败";
            log.error(msg,ex);
            return Result.failed(msg);
        }
    }

    @PostMapping("/dayRegister/djup")
    public Result updj(Long id){
            Integer uptj = attendanceService.uptj(id);
            Map<String,Object> map = new HashMap<>();
            map.put("uptj",uptj);
            return Result.success(map);
    }

    @PostMapping("/dayRegister/djup2")
    public Result updj2(Long id){
        Integer uptj2 = attendanceService.uptj2(id);
        Map<String,Object> map = new HashMap<>();
        map.put("uptj2",uptj2);
        return Result.success(map);
    }

    @PostMapping("/dayRegister/djup3")
    public Result updj3(Long id){
        Integer uptj3 = attendanceService.uptj3(id);
        Map<String,Object> map = new HashMap<>();
        map.put("uptj3",uptj3);
        return Result.success(map);
    }








}
