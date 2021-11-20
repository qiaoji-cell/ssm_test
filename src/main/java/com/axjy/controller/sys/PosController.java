package com.axjy.controller.sys;

import com.axjy.pojo.sys.PosGarden;
import com.axjy.pojo.sys.Pos;
import com.axjy.pojo.sys.User;
import com.axjy.service.sys.PosService;
import com.axjy.service.sys.PosGardenService;
import com.axjy.service.sys.UserService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.sys.QuickQueryVo;
import com.github.pagehelper.PageInfo;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Joe on 2021/10/19 上午 9:00
 */
@RestController
@RequestMapping("/sys")
@Transactional
public class PosController {

    @Resource
    private PosService posService;
    @Resource
    private PosGardenService posGardenService;
    @Resource
    private UserService userService;
    @GetMapping("/pos/list")
    public Result posList(QuickQueryVo quickQueryVo, HttpSession session){
//        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(quickQueryVo.getGardenId()==null){
            quickQueryVo.setGardenId(1L);
        }
        PageInfo posList = posService.findAllPos(quickQueryVo);
        return Result.success(posList);
    }
    @GetMapping("/pos/select")
    public Result posList(Long gardenId){
        return Result.success(posService.findAllList(gardenId));
    }

    public Object getPosByName(String posName,Long gardenId,Long posId){
        return posService.findByName(posName,gardenId,posId);
    }
    //添加页面
    @GetMapping("/pos/add")
    public ModelAndView posAdd(){
        return new ModelAndView("/sys/pos/add");
    }


    @PostMapping("/pos/add")
    public Result posAdd(Pos pos, Long gardenId){

        try {
            Object getPostByName = getPosByName(pos.getPosName(),gardenId,null);
            if(getPostByName !=null){
                return Result.failed("职位名称已存在，请重新输入");
            }
            //添加职位
            posService.addPos(pos);
            //添加职位园所关系
            PosGarden posGarden = new PosGarden();
            posGarden.setGardenId(gardenId);
            posGarden.setPosId(pos.getId());
            posGardenService.addPosRelation(posGarden);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return Result.failed("添加出错了");
        }
        return Result.success("添加成功！");
    }

//    @PostMapping("/pos/update")
//    public Result posUpdate(Pos pos,Long gardenId){
//
//        Object getPostByName = getPosByName(pos.getPosName(),gardenId);
//
//        if(getPostByName !=null){
//            return Result.failed("职位名称已存在，请重新输入");
//        }
//        try {
//            posService.updatePos(pos);
//        } catch (Exception e) {
//            return Result.failed("更新失败！");
//        }
//        return Result.success("更新成功！");
//    }

    //删除确认 有没有员工
    @PostMapping("/pos/del")
    public Result posDel(Long gardenId,Long[] ids){

        try {
            //确认有没有员工
            Integer countPosUser = userService.countDepUser(ids[0]);
            if(countPosUser>0){
                return Result.failed("删除失败！该职位下已有人员");
            }
            posService.delPos(ids);
            posGardenService.delPosRelation(gardenId,ids);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("删除失败！");
        }
        return Result.success("删除成功");
    }

    //修改页面
    @GetMapping("/pos/edit")
    public ModelAndView posEdit(){
        return new ModelAndView("sys/pos/edit");
    }

    @PostMapping("/pos/edit")
    public Result posEdit(Pos pos, Long gardenId){
        System.out.println(pos);
        //验证名称是否存在
        Object getPostByName = getPosByName(pos.getPosName(),gardenId,pos.getId());
        if(getPostByName !=null){
            return Result.failed("职位名称已存在，请重新输入");
        }
        try {
            posService.updatePos(pos);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.success("修改失败");
        }
        return Result.success("修改成功！");
    }




}
