package com.axjy.service.impl.recruit;

import com.axjy.mapper.reruit.StudentMapper;
import com.axjy.pojo.recruit.Student;
import com.axjy.service.recruit.StudentService;
import com.axjy.vo.recruit.CountVo;
import com.axjy.vo.recruit.KmsStudentVo;
import com.axjy.vo.recruit.ReturnDetailVo;
import com.axjy.vo.recruit.ReturnVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/13 下午 18:13
 */
@Service("studentService")
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;
    @Override
    public PageInfo findAllStudent(CountVo countVo, Student student) {
        PageHelper.startPage(countVo.getPage(),countVo.getLimit());
        List<Student> students = studentMapper.findAll(countVo,student);
        PageInfo pageInfo = new PageInfo(students);
        return pageInfo;
    }

    /**
     * 分页
     * 条件查询
     * 示数据
     * @param page
     * @param limit
     * @param student
     * @return
     */
    @Override
    public PageInfo searchPage(Integer page, Integer limit, Student student, KmsStudentVo kmsStudentVo) {
        PageHelper.startPage(page,limit);
        List<Student> studentList = studentMapper.findAllInput(student, kmsStudentVo);
        PageInfo pageInfo = new PageInfo(studentList);
        return pageInfo;
    }

    /* 对学生退费进行查询*/
    @Override
    public PageInfo searchPageReturn(Integer page, Integer limit, Student student, ReturnVo returnVo) {
        PageHelper.startPage(page,limit);
        List<Student> list= studentMapper.findAllReturn(returnVo,student);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    /**
     * 幼儿新增
     * @param student
     */
    @Override
    public void add(Student student) {
        studentMapper.insertSelective(student);
    }

    /**
     * 幼儿修改
     * @param student
     */
    @Override
    public void update(Student student) {
                studentMapper.updateByPrimaryKeySelective(student);
    }

    /**
     * 幼儿删除
     * @param id
     */
    @Override
    public void del(Long id) {
            studentMapper.deleteByPrimaryKey(id);
    }

    /**
     * 招生统计幼儿总人数
     */
    @Override
    public int zongrenshu(Student student) {
        return studentMapper.zrs(student);
    }

    /**
     * 招生统计幼儿金额总和
     * @return
     */
    @Override
    public int moneyhe(Student student) {
        return studentMapper.zonghe(student);
    }


    /**
     * 招生统计幼儿退费总和
     * @return
     */
    @Override
    public int tuifeizonghe(Student student) {
        return studentMapper.tuifeizonghe(student);
    }

    /**
     * 招生统计幼儿入园总和
     * @return
     */
    @Override
    public int ruyuan(Student student) {
        return studentMapper.ruyuan(student);
    }

    @Override
    public int weituifei(Student student) {
        return studentMapper.weituifei(student);
    }

    /**
     * 修改退费
     * @param student
     */
    @Override
    public void up(Student student) {
        studentMapper.updateByPrimaryKeySelective(student);
    }

    @Override
    public void tupdate(ReturnDetailVo returnDetailVo) {
        studentMapper.tupdate(returnDetailVo);
    }


}
