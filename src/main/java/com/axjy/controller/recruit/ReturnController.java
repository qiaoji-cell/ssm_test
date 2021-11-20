package com.axjy.controller.recruit;

import com.axjy.pojo.recruit.Student;
import com.axjy.pojo.sys.User;
import com.axjy.service.recruit.StudentService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.recruit.ReturnDetailVo;
import com.axjy.vo.recruit.ReturnVo;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Slf4j
@RestController
@RequestMapping("/recruit")
public class ReturnController {



    @Resource
    private StudentService returnService;

    @GetMapping("/return/index")
    public ModelAndView show(){
        ModelAndView modelAndView = new ModelAndView("recruit/return/index");
        return modelAndView;
    }


    @GetMapping("/return/search")
    public Result search(Integer page, Integer limit, ReturnVo returnVo, Student student, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        returnVo.setGardenId(getGardenId);
        PageInfo pageInfo  =returnService.searchPageReturn(page, limit, student, returnVo);
        return Result.success(pageInfo);
    }


    /**
     * 退费
     * @param 
     * @return
     */
    @PostMapping("/return/up")
    public Result update(@RequestBody ReturnDetailVo vo){
        try {
            returnService.tupdate(vo);
            return Result.success("退费成功");
        }catch (Exception ex){
            String msg = "退费失败";                                                        
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }

}
