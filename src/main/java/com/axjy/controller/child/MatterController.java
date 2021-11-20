package com.axjy.controller.child;

import com.axjy.pojo.child.StudentMatter;
import com.axjy.service.child.StudentMatterService;
import com.axjy.utils.Result;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/matter")
public class MatterController {
    /*注意事项的控制器*/

    /*注意事项service*/
    @Resource
    private StudentMatterService matterService;

    @GetMapping("/matterSearch")
    public Result add(String studentCode, Model model){
        StudentMatter matter = matterService.search(studentCode);

        model.addAttribute("matter",matter);
        return Result.success(matter,"查询成功");
    }

    /*对事项进行增加*/
    @PostMapping("/matter/insert")
    public Result insert(StudentMatter matter){

        try{
            matterService.insert(matter);
        }catch (Exception e){
            e.printStackTrace();

            return Result.failed("增加失败!");
        }
        return Result.failed("增加成功！");
    }

    /*对事项进行删除*/
    @GetMapping("/matter/delete")
    public Result delete(String studentCode){
        try {
            matterService.delete(studentCode);
        }catch (Exception e){
            return Result.failed("删除失败！");
        }
        return Result.failed("删除成功！");
    }

    /*对事项进行修改*/
    @PostMapping("/matter/update")
    public Result update(StudentMatter matter){
        System.out.println("注意事项------"+matter);
        try{
            matterService.update(matter);
        }catch (Exception e){
            return  Result.failed("修改失败！");
        }
     return Result.failed("修改成功！");

    }
}
