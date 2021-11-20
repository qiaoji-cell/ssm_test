package com.axjy.mapper.reruit;

import com.axjy.pojo.recruit.Grade;

import java.util.List;

public interface GradeMapper {

    void batchDelGradeByGardenId(Long[] ids);

    void batchAddGrade(Long gardenId);


    List<Grade> findAll(Long gardenId);

    int deleteByPrimaryKey(Long id);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
}