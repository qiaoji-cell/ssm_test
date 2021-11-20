package com.axjy.mapper.teach;

import com.axjy.pojo.teach.Classroom;
import com.axjy.vo.teach.ClassroomVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassroomMapper {

    List<Classroom> find(@Param("classroomVo") ClassroomVo classroomVo);

    List<Classroom> findQuery(@Param("classroomVo") ClassroomVo classroomVo);


    int deleteByPrimaryKey(Long id);

    int insert(Classroom record);

    int insertSelective(Classroom record);

    Classroom selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Classroom record);

    int updateByPrimaryKey(Classroom record);
}