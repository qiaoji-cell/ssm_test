package com.axjy.mapper.teach;

import com.axjy.pojo.teach.Subject;

import java.util.List;

public interface SubjectMapper {

    List<Subject> find(Long gardenId);

    int deleteByPrimaryKey(Long id);

    int insert(Subject record);

    int insertSelective(Subject record);

    Subject selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Subject record);

    int updateByPrimaryKey(Subject record);
}