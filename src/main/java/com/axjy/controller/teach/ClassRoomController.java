package com.axjy.controller.teach;

import com.axjy.pojo.sys.User;
import com.axjy.pojo.teach.Classroom;
import com.axjy.service.teach.ClassroomService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.teach.ClassroomVo;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/classRoom")
public class ClassRoomController {
    @Resource
    private ClassroomService classroomService;

    @GetMapping("/searchQuery")
    private Result searchQuery(ClassroomVo classroomVo){
        classroomVo.setRoomState(1);
        List<Classroom> list =  classroomService.find(classroomVo);
        System.out.println(classroomVo+"list二-------------------------------------"+list);
        return Result.success(list,"查询成功！");
    }
    @GetMapping("/search")
    private Result search(Integer page, Integer limit, ClassroomVo classroomVo, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        System.out.println(classroomVo+"传过来的vo-----------");
        if (getGardenId>0){
            classroomVo.setGardenId(getGardenId);
        }

        PageInfo pageInfo  = classroomService.searchPage(page,limit,classroomVo);
        return Result.success(pageInfo);
    }

    /*查询教室列表*/
    @GetMapping("/searchAll")
    private Result searchAll(ClassroomVo classroomVo){
        List<Classroom> list =  classroomService.find(classroomVo);
        System.out.println(classroomVo+"list-------------------------------------"+list);
        return Result.success(list,"查询成功！");
    }

    @PostMapping("/insert")
    private Result insert(Classroom classroom,HttpSession session){
        if (classroom.getGradename()==null){
            return Result.success("教室名称不能为空！");
        }
        if (classroom.getConttainNum()==null && classroom.getConttainNum()<0){
            return Result.success("容纳人数不能为空！");
        }
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        classroom.setGardenId(getGardenId);
        classroomService.insert(classroom);
        return Result.success("增加成功！");
    }
    @PostMapping("/update")
    private Result update(Classroom classroom){
        classroomService.update(classroom);
        return Result.success("修改成功！");
    }

    @GetMapping("/delete")
    private Result delete(Long id){
        classroomService.delete(id);
        return Result.success("删除成功！");
    }
}
