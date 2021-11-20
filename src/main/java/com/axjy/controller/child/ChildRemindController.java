package com.axjy.controller.child;


import com.axjy.pojo.child.ChildRemind;
import com.axjy.pojo.sys.User;
import com.axjy.service.child.ChildRemindService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.child.ChildVo;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;

@RestController
@RequestMapping("/remind")
public class ChildRemindController {
    @Resource
    private ChildRemindService remindService;
        @GetMapping("/search")
        public Result search(Integer page, Integer limit, ChildVo vo, HttpSession session){
            System.out.println(vo+"传来的数据！");
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            Long getGardenId =  user.getGarden_id();
            if (getGardenId>0){
                vo.setGardenId(getGardenId);
            }
            PageInfo pageInfo  = remindService.searchPage(page,limit,vo);
            return Result.success(pageInfo);
        }
        /*增加！！！！！*/
        @PostMapping("/insert")
        public Result insert(ChildRemind remind,HttpSession session){

            if (remind.getStatus()<=0){
                return Result.failed("请选择状态！");
            }
            if(remind.getStudentId()==null){
                return Result.failed("请选择学生！");
            }
            if(remind.getRemindContent()==null){
                return Result.failed("请输入提醒内容!");
            }

            LocalDate createTime =  LocalDate.now();

            if(remind.getRemindDate()==null){
                return  Result.failed("请输入提醒时间！");
            }
            /*时间进行对比*/
            if (remind.getRemindDate().isBefore(createTime)){
                return  Result.failed("请输入正确的提醒时间");
            }
            System.out.println(remind+"----------------------");
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            //录入人
            Integer userId = user.getId();
            //所属园所
            Long getGardenId =  user.getGarden_id();
            remind.setCreatedBy(userId);
            remind.setGardenId(getGardenId);
            remind.setCreationDate(LocalDate.now());
            remindService.insert(remind);
            return Result.success("增加成功！");
        }
        @PostMapping("/update")
        public Result updateRemind(ChildRemind remind){
            System.out.println(remind.getStatus()+"状态！！！！！！！！！！！！！！！！");
            System.out.println(remind+"-----------------修改的数据");
            remindService.update(remind);
            return Result.success("修改成功！");
        }
        @GetMapping("/delete")
         public Result delete(Long id){
            System.out.println(id+"-----------------id");
            remindService.delete(id);
            return Result.success("删除成功！");
        }



}
