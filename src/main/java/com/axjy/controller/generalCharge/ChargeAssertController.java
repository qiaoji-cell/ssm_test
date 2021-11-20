package com.axjy.controller.generalCharge;

import com.axjy.pojo.generalCharge.ChargeRecord;
import com.axjy.pojo.generalCharge.CostCategory;
import com.axjy.pojo.generalCharge.Groove;
import com.axjy.pojo.sys.User;
import com.axjy.service.generalCharge.ChargeRecordService;
import com.axjy.service.generalCharge.GrooveService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.generalCharge.CostQueryVo;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Created by Joe on 2021/10/31 上午 09:01
 */
@RestController
@RequestMapping("/generalCharge")
@Slf4j
public class ChargeAssertController {
    @Resource
    private GrooveService grooveService;
    @Resource
    private ChargeRecordService chargeRecordService;



    @GetMapping("/assert/list")
    public Result list(CostQueryVo vo, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(user.getGarden_id()>0){
            //使用用户携带的机构id
            vo.setGardenId(user.getGarden_id());
        }
        log.error("园所id:"+vo.getGardenId());

        PageInfo grooves = null;
        try {
            grooves =  grooveService.findAllGardenId(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.success(grooves);
    }
    @GetMapping("/assert/add")
    public ModelAndView add(){
        return new ModelAndView("generalCharge/assert/add");
    }
    @PostMapping("/assert/add")
    public Result add(Groove groove){

        try {
            groove.setCreateDate(LocalDateTime.now());
            grooveService.addGrooveCharge(groove);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("添加失败！联系管理员");
        }
        return Result.success("添加成功！");
    }
    @GetMapping("/assert/edit")
    public ModelAndView edit(){
        return new ModelAndView("generalCharge/assert/edit");
    }

    @PostMapping("/assert/edit")
    public Result up(Groove groove){
        try {
            grooveService.upGrooveCharge(groove);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("修改失败！联系管理员");
        }
        return Result.success("修改成功！");
    }

    @PostMapping("/assert/del")
    public Result del(Long id){

        try {
            String grooveName = grooveService.findById(id).getGrooveName();
            //删除费项前 查询费项有无记录
            Integer res = chargeRecordService.countRecordByGrooveName(grooveName);
            if(res>0){
                return Result.failed("已经产生收费记录，无法删除");
            }
            grooveService.delGrooveCharge(id);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("删除失败！联系管理员");
        }
        return Result.success("删除成功！");
    }
}
