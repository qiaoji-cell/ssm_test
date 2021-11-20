package com.axjy.controller.dayRegister;

import com.axjy.pojo.teach.Classmodel;
import com.axjy.pojo.dayRegister.OurseAttendanceRecord;
import com.axjy.service.dayRegister.OurseAttendanceRecordService;
import com.axjy.utils.Result;
import com.axjy.vo.dayRegisterVo.DayVo;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/attendance")
public class OurseAttendanceRecordController {

    @Resource
    private OurseAttendanceRecordService ourseAttendanceRecordService;

    /**
     * 跳转到课程考勤页面
     * @return
     */
    @GetMapping("/courseRegister/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("attendance/courseRegister/index");
        return modelAndView;
    }

    @GetMapping("/courseRegister/search")
    public Result search(Integer page, Integer limit, OurseAttendanceRecord ourseAttendanceRecord){
        PageInfo pageInfo = ourseAttendanceRecordService.findAll(page, limit, ourseAttendanceRecord);
        return Result.success(pageInfo);
    }

    /**
     * 班型
     * @return
     */
    @GetMapping("/courseRegister/model")
    public Result model(){
        List<Classmodel> list = ourseAttendanceRecordService.findAl();
        return Result.success(list);
    }

    /**
     * 课程考勤登记的批量删除
     * @param ids
     * @return
     */
    @PostMapping("/courseRegister/del")
    public Result pldel(@RequestBody Integer[] ids){
        try {
            ourseAttendanceRecordService.pldelete(ids);
            return Result.success("删除成功");
        }catch (Exception ex){
            String msg = "删除失败";
            log.error(msg,ex);
            return Result.failed(msg);
        }
    }

    /*课程考勤登记修改*/
    @PostMapping("/courseReister/djup")
    public Result djup(DayVo dayvo){
        try {
            ourseAttendanceRecordService.djup(dayvo);
            return Result.success("登记成功");
        }catch (Exception ex){
            String msg = "登记失败";
            log.error(msg,ex);
            return Result.failed(msg);
        }
    }






}
