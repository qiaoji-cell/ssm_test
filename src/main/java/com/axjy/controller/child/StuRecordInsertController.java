package com.axjy.controller.child;

import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.pojo.child.StudentMatter;
import com.axjy.pojo.sys.User;
import com.axjy.service.child.StudentMatterService;
import com.axjy.service.child.StudentRecordService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/record")
public class StuRecordInsertController {
    @Resource
    private StudentMatterService matterService;
    @Resource
    private StudentRecordService recordService;
    @PostMapping("/record/add")
    public Result insert(KmsStudentRecord record, StudentMatter matter, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);

        Long getGardenId =  user.getGarden_id();
        if (getGardenId>0){
            record.setGardenId(getGardenId);
        }
        recordService.insert(record);
        return Result.success("添加成功！");
    }
    @PostMapping("/record/update")
    public Result update(KmsStudentRecord record){
        System.out.println(record+"基本信息----------------");
        recordService.update(record);
        return Result.success("修改成功！");
    }



}
