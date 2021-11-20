package com.axjy.controller.child;

import com.axjy.pojo.child.Parents;
import com.axjy.service.child.ParentsService;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/parents")
public class ParentsController {
    /*监护人控制器*/

    /*调用监护人service*/
    @Resource
    private ParentsService parentsService;
    @GetMapping("/search")
    public Result search(String studentCode){

            Parents parents = parentsService.find(studentCode);
            System.out.println(parents+"监护人信息");

            return Result.success(parents,"监护人查询成功！");
    }
    /*监护人数据增加 （暂时无判断）*/
    @PostMapping("/parents/add")
    public Result add(Parents parents){
        try{
            parentsService.insert(parents);
        }catch(Exception e){
            e.printStackTrace();
            return Result.failed("增加失败");
        }
            return Result.success("增加成功！");
    };

    /*删除监护人*/
    @GetMapping("/parents/delete")
    public Result delete(String studentCode){
        try{
            parentsService.delete(studentCode);
        }catch (Exception e){
            e.printStackTrace();
            return Result.failed("删除成功！");
        }
        return Result.failed("删除失败！");
    }

    @PostMapping("/parents/update")
    public Result update(Parents parents){
        System.out.println(parents+"----------监护人");
        try{
            parentsService.update(parents);
        }catch (Exception e){
            return Result.failed("修改成功！");
        }
        return Result.failed("修改失败！");
    }

}
