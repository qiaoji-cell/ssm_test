package com.axjy.controller.teach;


import com.axjy.pojo.teach.AttendClass;
import com.axjy.service.teach.AttendClassService;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/teach")
public class AttendClassController {
    @Resource
    private AttendClassService attendClassService;
    @GetMapping("/register/search")
    public Result search(Long classroomId){
          List<AttendClass> list = attendClassService.find(classroomId);
        return Result.success(list,"查询成功！");
    }
    @PostMapping("/register/insert")
    public Result insert(AttendClass attendClass){
        attendClassService.insert(attendClass);
        return  Result.success("增加成功！");
    }
    @PostMapping("/register/update")
    public Result update(AttendClass attendClass){
        attendClassService.update(attendClass);
        return  Result.success("修改失败！");
    }
    @GetMapping("/register/delete")
    public Result delete(Long id){
        attendClassService.delete(id);
        return  Result.success("删除成功！");
    }
}
