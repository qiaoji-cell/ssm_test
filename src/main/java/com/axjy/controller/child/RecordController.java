package com.axjy.controller.child;

import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.pojo.sys.User;
import com.axjy.service.child.StudentRecordService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.child.StudentCodeVo;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/base")
public class RecordController {

    @Resource
    private StudentRecordService recordService;

    @GetMapping("/record/leaveSearch")
    public Result leaveSearch(Integer classroomId,Long gardenId){
        List<KmsStudentRecord> list = recordService.searchStatus(1, classroomId,gardenId);
        return  Result.success(list,"查询成功！");
    }

   /* @Resource
    private ParentsService parentsService;
*/
    @GetMapping("/record/index")
    public ModelAndView index(){
        return new ModelAndView("/child/record/index");
    }

    //对幼儿档案进行查询
    @GetMapping("/record/search")
    public Result search(Integer page, Integer limit, KmsStudentRecord studentRecord, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        if (getGardenId>0){
            studentRecord.setGardenId(getGardenId);
        }
        System.out.println(studentRecord.getGardenId()+"登录人所属的园所------------------------");
        PageInfo pageInfo  = recordService.searchPage(page,limit,studentRecord);
        return Result.success(pageInfo);
    }


    //新家的 提醒查询
    @GetMapping("/record/searchEr")
    public Result searchEr(Integer page, Integer limit,KmsStudentRecord studentRecord){
        PageInfo pageInfoEr  = recordService.searchPageEr(page,limit,studentRecord);
        System.out.println(pageInfoEr+"---------------------------------提醒控制器的数据");
        return Result.success(pageInfoEr);
    }

    /*对档案表进行修改*/
    @GetMapping("/record/update")
    public Result update(KmsStudentRecord record){
        try {
            recordService.update(record);
        }catch (Exception e){
            e.printStackTrace();
            return Result.failed("修改失败！");
        }
        return Result.failed("修改成功！");
    }




    @GetMapping("/record/termSearch")
    public Result termSearch(Long classroomId){
        List<KmsStudentRecord> studentRecords = recordService.find(classroomId);
        System.out.println(studentRecords+"--------------根据班级查档案");
        return  Result.success(studentRecords,"查询成功！");
    }


    @PostMapping("/record/lotUpdate")
    public Result lotUpdate(@RequestBody StudentCodeVo studentCode){
        System.out.println("过来啦！");
        try{
            recordService.updateLot(studentCode);
        }catch (Exception e){
            e.printStackTrace();
            return Result.success("调班失败！");

        }
        System.out.println("返回啊!");
        return Result.success("调班成功！");
    }

/*  @PostMapping("/record/updateRecord")
    public Result updateRecord(KmsStudentRecord record){
        recordService.update(record);

    }*/
    /*对幼儿监护人进行查询*/
  /*  @GetMapping("/parent/search")
    public Result parentsSearch(String studentCode){
        List<Parents> list = parentsService.find(studentCode);
        return  Result.success(list,"查询成功！");
    }*/
}
