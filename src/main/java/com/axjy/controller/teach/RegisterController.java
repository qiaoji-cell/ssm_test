package com.axjy.controller.teach;

import com.axjy.pojo.teach.Register;
import com.axjy.service.teach.RegisterService;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/register")
public class RegisterController {
    @Resource
    private RegisterService registerService;

    @GetMapping("/search")
    public Result search(Long classModelId){
        List<Register> list = registerService.find(classModelId);
        return Result.success(list,"查询成功！");
    }

    @PostMapping("/insert")
    public Result insert(Register register){
        int count = registerService.query(register.getStudentId());
        System.out.println(register+"---------------值是什么");
        System.out.println(count+"是否已经存在！！！！");
        if(count>0){
            return Result.success("改幼儿已经存在了哦！");
        }

        /*时间进行对比*/
        if (register.getEndDate().isBefore(register.getStartDate())){
            return  Result.success("请输入正确的提醒时间");
        }
        else{
            registerService.insert(register);
            return Result.success("增加成功！");
        }
    }

    @PostMapping("/update")
    public Result update(Register register){
        System.out.println(register+"改----------------");
        registerService.update(register);
        return Result.failed("修改成功！");
    }
    @GetMapping("/delete")
    public Result delete(Long id){
        registerService.delete(id);
        return Result.success("删除成功！");
    }
}
