package com.axjy.controller.sys;

import com.axjy.pojo.child.ChildRemind;
import com.axjy.pojo.recruit.Student;
import com.axjy.pojo.sys.User;
import com.axjy.service.child.ChildRemindService;
import com.axjy.service.child.StudentRecordService;
import com.axjy.service.generalCharge.ChargeRecordService;
import com.axjy.service.generalCharge.GrooveService;
import com.axjy.service.recruit.StudentService;
import com.axjy.service.sys.UserService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/count")
public class ShowCountController {
    @Resource
    private UserService userService;
    @Resource
    private StudentService studentService;
    @Resource
    private StudentRecordService recordService;

    @Resource
    private ChildRemindService remindService;

    @Resource
    private ChargeRecordService chargeRecordService;

    @Resource
    private GrooveService grooveService;

    @GetMapping("/countUser")
    public Result countUser(Long gardenId, HttpSession session){
        //统计用户数量
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        int count = userService.countUser(getGardenId);
        System.out.println(count+"用户！！");
        return Result.success(count);
    }
    /*统计招生人数*/
    @GetMapping("/countStudent")
    public Result StudentCount(Student student,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        student.setGardenId(getGardenId);
        int count = studentService.zongrenshu(student);
        return Result.success(count);
    }
    @GetMapping("/countRecord")
    public Result RecordCount(HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        int count = recordService.recordCount(getGardenId);
        return Result.success(count);
    }
    @ResponseBody
    @PostMapping("/MonthAll")
    public Map MonthCount(HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();

        if (getGardenId==0){
            getGardenId=null;
        }
        System.out.println(getGardenId+"----------------*************************");
        Map map = new HashMap();
        List list = new ArrayList();
        Integer yi1=recordService.yiyue(getGardenId);
        Integer yi2=recordService.eryue(getGardenId);
        Integer yi3=recordService.sanyue(getGardenId);
        Integer yi4=recordService.siyue(getGardenId);
        Integer yi5=recordService.wuyue(getGardenId);
        Integer yi6=recordService.liuyue(getGardenId);
        Integer yi7=recordService.qiyue(getGardenId);
        Integer yi8=recordService.bayue(getGardenId);
        Integer yi9=recordService.jiuyue(getGardenId);
        Integer yi10=recordService.shiyue(getGardenId);
        Integer yi11=recordService.shiyiyue(getGardenId);
        Integer yi12=recordService.shieryue(getGardenId);
        list.add(yi1);
        list.add(yi2);
        list.add(yi3);
        list.add(yi4);
        list.add(yi5);
        list.add(yi6);
        list.add(yi7);
        list.add(yi8);
        list.add(yi9);
        list.add(yi10);
        list.add(yi11);
        list.add(yi12);

        map.put("str",list);
        System.out.println(map+"-------");
        return map;
    }

    @GetMapping("/remindShow")
    private Result remindShow(HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        List<ChildRemind> list = remindService.remindShow(getGardenId);
        System.out.println(list+"提醒的信息！");
        return Result.success(list);
    }

    /*统计每个月份的收入*/
    @ResponseBody
    @PostMapping("/ChargeMonthAll")
    public Map ChargeCount(HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        Map map = new HashMap();
        List list = new ArrayList();
        if (getGardenId==0){
            getGardenId=null;
        }
        double yi1=chargeRecordService.yiyue(getGardenId);
        double yi2=chargeRecordService.eryue(getGardenId);
        double yi3=chargeRecordService.sanyue(getGardenId);
        double yi4=chargeRecordService.siyue(getGardenId);
        double yi5=chargeRecordService.wuyue(getGardenId);
        double yi6=chargeRecordService.liuyue(getGardenId);
        double yi7=chargeRecordService.qiyue(getGardenId);
        double yi8=chargeRecordService.bayue(getGardenId);
        double yi9=chargeRecordService.jiuyue(getGardenId);
        double yi10=chargeRecordService.shiyue(getGardenId);
        double yi11=chargeRecordService.shiyiyue(getGardenId);
        double yi12=chargeRecordService.shieryue(getGardenId);
        list.add(yi1);
        list.add(yi2);
        list.add(yi3);
        list.add(yi4);
        list.add(yi5);
        list.add(yi6);
        list.add(yi7);
        list.add(yi8);
        list.add(yi9);
        list.add(yi10);
        list.add(yi11);
        list.add(yi12);
        map.put("str",list);
        System.out.println(map+"-------"+"价钱的");
        return map;
    }
    @ResponseBody
    @PostMapping("/GrooveCount")
    public Map GrooveCount(HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        Map map = new HashMap();
        List list = new ArrayList();
        double huoshi = grooveService.huoshi(getGardenId);
        double jiaocai=grooveService.jiaoCai(getGardenId);
        double weisheng = grooveService.weisheng(getGardenId);
        double zhanwei = grooveService.zhanwei(getGardenId);
        double yuanfu = grooveService.yuanfu(getGardenId);
        list.add(huoshi);
        list.add(jiaocai);
        list.add(weisheng);
        list.add(zhanwei);
        list.add(yuanfu);
        map.put("str",list);
        return map;
    }
}
