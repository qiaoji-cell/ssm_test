package com.axjy.mapper.reruit;

import com.axjy.pojo.recruit.Student;
import com.axjy.vo.recruit.CountVo;
import com.axjy.vo.recruit.KmsStudentVo;
import com.axjy.vo.recruit.ReturnDetailVo;
import com.axjy.vo.recruit.ReturnVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {

    List<Student> findAll(@Param("countVo") CountVo countVo, @Param("student") Student student);

    List<Student> findAllInput(@Param("student") Student student, @Param("kmsStudentVo") KmsStudentVo kmsStudentVo);

    List<Student> findAllReturn(@Param("returnVo") ReturnVo returnVo, @Param("student") Student student);

    //招生统计里的总人数
    int zrs(@Param("student") Student  student);
    //招生统计里的金额总和
    int zonghe(@Param("student") Student  student);
    //招生统计里的已退费总和
    int tuifeizonghe(@Param("student") Student  student);
    //招生统计里的入园人数
    int ruyuan(@Param("student") Student  student);
    //招生统计里的未退费
    int weituifei(@Param("student") Student  student);

    void tupdate(@Param(value = "returnDetailVo") ReturnDetailVo returnDetailVo);

    int deleteByPrimaryKey(Long id);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}