package com.axjy.controller.base;

import com.axjy.pojo.base.Class;
import com.axjy.pojo.base.UpClassRecord;
import com.axjy.pojo.sys.User;
import com.axjy.service.common.ClassService;
import com.axjy.service.base.UpClassRecordService;
import com.axjy.service.sys.UserService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.base.SettingQuery;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Joe on 2021/10/28 下午 14:16
 */
@RestController
@RequestMapping("/base")
@Transactional
public class UserSettingController {

    @Resource
    private UserService userService;
    @Resource
    private UpClassRecordService upClassRecordService;
    @Resource
    private ClassService classService;


    @GetMapping("/setting/list")
    public Result userList(SettingQuery vo,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long gardenId = user.getGarden_id();
        //只显示指定园所的用户列表
        if(gardenId>0){
            vo.setGardenId(gardenId);
        }
        return Result.success(userService.findSettingUser(vo));
    }

    @PostMapping("/setting/changeState")
    public Result changeState(User user){
        System.out.println("======"+user);
        try {
            userService.UpdateState(user);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("状态修改失败！");
        }
        return Result.success("状态修改成功！");
    }

    @GetMapping("/setting/editClass")
    public ModelAndView editClass(){
        return new ModelAndView("base/setting/editClass");
    }
    @GetMapping("/setting/ClassList")
    public Result getClassList(){
        List<Class> classList =  classService.findGardenClass();
        return Result.success(classList,"查询成功");
    }

    @GetMapping("/setting/upClassRecord")
    public Result upClassRecord(SettingQuery vo){
        return Result.success(upClassRecordService.findAllByUserCode(vo));
    }

    @PostMapping("/setting/add")
    public Result add(UpClassRecord record, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        record.setUpUser(user.getUserName());
        try {
            if(record.getOldClass().equals(record.getNewClass())){
                return Result.failed("已是该班级人员，请重新选择！");
            }
            //更新用户的班级id
            userService.updateClassId(record.getClassId(),record.getUserCode());
            //添加更改记录
            upClassRecordService.addRecord(record);
            //done
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("变更失败！");
        }
        return Result.success("变更成功！");
    }
}
