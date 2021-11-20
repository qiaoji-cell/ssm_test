package com.axjy.controller.base;

import com.axjy.pojo.base.Garden;
import com.axjy.service.common.ClassService;
import com.axjy.service.base.GardenService;
import com.axjy.service.generalCharge.GrooveService;
import com.axjy.service.recruit.GradeService;
import com.axjy.service.sys.UserGardenService;
import com.axjy.utils.Result;
import com.axjy.vo.base.CodeNameVo;
import com.axjy.vo.base.GardenVo;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/15 下午 17:35
 */
@RestController
@RequestMapping("/base")
public class GardenController {

    @Resource
    private GardenService gardenService;
    @Resource
    private UserGardenService userGardenService;
    @Resource
    private GradeService gradeService;
    @Resource
    private ClassService classService;
    @Resource
    private GrooveService grooveService;

    @GetMapping("/assert/list")
    public Result assertIndex(GardenVo gardenVo){
        PageInfo pageInfo = gardenService.findAllGarden(gardenVo);
        return Result.success(pageInfo);
    }

    @GetMapping("/assert/select")
    public Result assertSelect(){
        return Result.success(gardenService.findAllGarden());
    }

    //根据园所id查询园所
    @GetMapping("/assert/orgList")
    public Result orgList(GardenVo gardenVo){
        return Result.success(gardenService.findAllGarden(),"查询成功！");
    }


    @GetMapping("/assert/edit")
    public ModelAndView assertUpdate(){
        return new ModelAndView("base/assert/edit");
    }
    @PostMapping("/assert/del")
    public Result assertDel(Long[] ids){
        //删除前确认
        // 根据园所id统计人员
        int count =  userGardenService.countUserByGardenId(ids[0]);
        System.out.println("人数："+count);
        // 根据园所id统计生员
        if(count>0){
            return Result.failed("删除失败,园所已有人员");
        }
        try {
            //删除园所年级
            gradeService.batchDelGradeByGardenId(ids);
            //删除园所班级
            classService.batchDelClassByGardenId(ids);
            gardenService.delGarden(ids);

        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("删除失败！");
        }
        return Result.success("删除成功！");
    }

    //更新url 带有id
    @PostMapping("/assert/edit")
    public Result update(Garden garden){
        CodeNameVo code = new CodeNameVo();
        code.setGardenCode(garden.getGardenCode());
        code.setId(garden.getId());
        //验证编码
        Object checkCode = gardenService.findByCode(code);
        if(checkCode!=null){
            return Result.failed("编码已存在，请重新输入");
        }
        CodeNameVo name = new CodeNameVo();
        name.setGardenName(garden.getGardenName());
        name.setId(garden.getId());
        //验证名称
        Object checkName = gardenService.findByName(name);
        if(checkName!=null){
            return Result.failed("名称已存在，请重新输入");
        }
        try {
            gardenService.editGarden(garden);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("修改失败！");
        }
        return Result.success("修改成功！");
    }

    @GetMapping("/assert/add")
    public ModelAndView assertAdd(){
        return new ModelAndView("base/assert/add");
    }

    @PostMapping("/assert/add")
    public Result addPost(Garden garden){
        try {
            CodeNameVo code = new CodeNameVo();
            code.setGardenCode(garden.getGardenCode());
            //验证编码
            Object checkCode = gardenService.findByCode(code);
            if(checkCode!=null){
                return Result.failed("编码已存在，请重新输入");
            }
            CodeNameVo name = new CodeNameVo();
            name.setGardenCode(garden.getGardenName());
            //验证名称
            Object checkName = gardenService.findByName(name);
            if(checkName!=null){
                return Result.failed("名称已存在，请重新输入");
            }
            //添加园所 园所返回自增id
            gardenService.addGarden(garden);
            //通过自增id 批量添加年级
            gradeService.batchAddGrade(garden.getId());
            //通过自增id 批量添加班级
            classService.batchAdd(garden.getId());
            //通过自增id 批量添加费项
            grooveService.batchAdd(garden.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("添加失败");
        }
       return Result.success("添加成功！");
    }

}
