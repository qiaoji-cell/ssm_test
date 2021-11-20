package com.axjy.controller.child;

import com.axjy.service.child.StudentRecordService;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/record/delete")
public class RecordDeleteController {
    @Resource
    private StudentRecordService recordService;
    @GetMapping("/deleteRecord")
    public Result delete(String studentCode){

        System.out.println(studentCode+"删除----------------------------");
        try{
            recordService.delete(studentCode);
        }catch (Exception e){
            e.printStackTrace();
            return Result.failed("删除失败！");
        }

        return Result.failed("删除成功！");
    }
}
