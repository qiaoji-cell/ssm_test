package com.axjy.mapper.child;

import com.axjy.pojo.child.StudentMatter;
import org.apache.ibatis.annotations.Param;

public interface StudentMatterMapper {
    StudentMatter find(@Param("studentCode") String studentCode);

    int delete(String studentCode);

    int deleteByPrimaryKey(Long id);

    int insert(StudentMatter record);

    int insertSelective(StudentMatter record);

    StudentMatter selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(StudentMatter record);

    int updateByPrimaryKey(StudentMatter record);
}