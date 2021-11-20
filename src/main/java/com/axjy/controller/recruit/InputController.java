package com.axjy.controller.recruit;

import com.axjy.pojo.base.Class;
import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.pojo.recruit.Student;
import com.axjy.pojo.sys.User;
import com.axjy.service.child.StudentRecordService;
import com.axjy.service.common.ClassService;
import com.axjy.service.recruit.StudentService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.recruit.KmsStudentVo;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.time.LocalDate;
import java.util.Date;

@Slf4j
@RestController
@RequestMapping("/recruit")
public class InputController {


    @Resource
    private StudentService studentService;

    @Resource
    private StudentRecordService recordService;


    @Resource
    private ClassService classService;
    /**

    /**
     * 访问招生管理里面的页面
     * @return
     */
    @GetMapping("/input/index")
    public ModelAndView input(){
        ModelAndView modelAndView = new ModelAndView("recruit/input/index");
        return modelAndView;
    }

    /**
     *
     * @param page
     * @param limit
     * @param student
     * @param kmsStudentVo
     * @return
     */
    @GetMapping("/input/search")
    public Result search(Integer page, Integer limit, Student student, KmsStudentVo kmsStudentVo, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Long getGardenId =  user.getGarden_id();
        kmsStudentVo.setGardenId(getGardenId);
        PageInfo pageInfo =  studentService.searchPage(page, limit, student, kmsStudentVo);
        return Result.success(pageInfo);
    }

    /**
     * 幼儿新增
     * @param student
     * @return
     */
    @PostMapping("/add")
    public Result add(Student student, MultipartFile picture, HttpSession session, HttpServletRequest request){
        try {
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            Long getGardenId =  user.getGarden_id();
            //添加图片路径
            String uploadPath = request.getRealPath("/statics/");
            System.out.println(uploadPath);
            File targetFile = new File(uploadPath+File.separator+"localImg");
            uploadPath = targetFile.getPath();
            if(!targetFile.exists()){
                targetFile.mkdir();
            }
            String time = ""+new Date().getTime();
            File file = new File(uploadPath+File.separator+time+picture.getOriginalFilename());
            System.out.println(file.getName());
            String pictureUrl = file.getName();
            picture.transferTo(file);
            if (student.getIntoKindergarten()==0){
                KmsStudentRecord record = new KmsStudentRecord();
                record.setStudentName(student.getStudentname());
                record.setStudentCode(student.getStudentCode());
                record.setGender(student.getGender());
                record.setGradeId(student.getGradeId());
                record.setBrithday(student.getBrithday());
                Class aClass = classService.findClass(getGardenId);
                record.setEnterDate(student.getWillIntoDate());
                record.setClassroomId(aClass.getId());
                record.setStatusId(1);
                record.setAttendanceId(1);
                record.setCreateDate(LocalDate.now());
                record.setGardenId(getGardenId);

                record.setPicture(pictureUrl);

                System.out.println("档案录入 园所id"+getGardenId);
                recordService.insert(record);
            }
            student.setGardenId(getGardenId);
            student.setPictrue(pictureUrl);

            studentService.add(student);
            return Result.success("幼儿添加成功");
        }catch (Exception ex){
            String msg = "幼儿添加失败";
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }

    /**
     * 幼儿修改
     * @param student
     * @return
     */
    @PostMapping("/update")
    public Result update(Student student,HttpSession session){
        try {
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            Long getGardenId =  user.getGarden_id();
            student.setGardenId(getGardenId);
            studentService.update(student);
            System.out.println("修改"+ student);
            return Result.success("幼儿修改成功");
        }catch (Exception ex){
            String msg = "幼儿修改失败";
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }

    /**
     * 幼儿删除
     * @param id
     * @return
     */
    @PostMapping("/del")
    public Result del(Long id){
        try {
            studentService.del(id);
            return Result.success("幼儿删除成功");
        }catch (Exception ex){
            String msg = "幼儿删除失败";
            log.error(msg,ex);
            return  Result.failed(msg);
        }
    }


}
