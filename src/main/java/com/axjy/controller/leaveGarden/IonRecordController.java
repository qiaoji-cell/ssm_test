package com.axjy.controller.leaveGarden;


import com.axjy.pojo.leaveGarden.IonRecord;
import com.axjy.pojo.sys.User;
import com.axjy.service.leaveGarden.IonRecordService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/leaveGarden")
public class IonRecordController {
    @Resource
    private IonRecordService ionRecordService;

    @GetMapping("/register/search")
    private Result search(Integer classroomId,Long gardenId, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        if (getGardenId<=0){
            getGardenId = gardenId;
        }
        List<IonRecord> list = ionRecordService.list(getGardenId,classroomId);
        return Result.success(list,"查询成功！");
    }

    /*对离园记录进行增加*/
    @PostMapping("/register/insert")
    private Result insert(IonRecord record,HttpSession session){
        System.out.println(record+"---------------离园登记里的");
        record.setState(1);
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        record.setGardenid(getGardenId);
        ionRecordService.insert(record);
        return Result.success("增加成功！");
    }
    /*对审核的幼儿进行修改状态*/
    @GetMapping("/register/update")
    public Result update(IonRecord record){
        System.out.println(record+"嘎嘎嘎嘎嘎嘎");
        ionRecordService.update(record);
        return Result.success("修改成功！");
    }
}
