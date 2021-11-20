package com.axjy.mapper.teach;

import com.axjy.pojo.teach.AttendClass;

import java.util.List;

public interface AttendClassMapper {

    List<AttendClass> find(Long classModeId);

    int deleteByPrimaryKey(Long id);

    int insert(AttendClass record);

    int insertSelective(AttendClass record);

    AttendClass selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AttendClass record);

    int updateByPrimaryKey(AttendClass record);
}