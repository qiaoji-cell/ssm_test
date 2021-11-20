package com.axjy.controller.base;

import com.axjy.pojo.base.GardenRule;
import com.axjy.service.base.GardenRuleService;
import com.axjy.utils.Result;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/30 上午 11:47
 */
@RestController
@RequestMapping("/base")
@Transactional
public class RuleController {

    @Resource
    private GardenRuleService gardenRuleService;

    @GetMapping("/rule/edit")
    public ModelAndView edit(){
        return new ModelAndView("base/rule/edit");
    }

    @PostMapping("/rule/add")
    public Result ruleAdd(GardenRule gardenRule){
        try {
            //删除原来的规则
            gardenRuleService.delRule(Long.parseLong(gardenRule.getGardenId()));
            //保存新的规则
            gardenRuleService.addRule(gardenRule);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("保存失败了！");
        }
        return Result.success("保存成功了！");
    }

    @GetMapping("/rule/find")
    public Result find(Long gardenId){
        GardenRule gardenRule = null;
        System.out.println(gardenId);
        try {
            gardenRule = gardenRuleService.findByGardenId(gardenId);
        } catch (Exception e){
            return Result.failed("查找出错！");
        }
        return Result.success(gardenRule);
    }

}
