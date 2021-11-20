package com.axjy.mapper;

import com.axjy.pojo.AttendanceState;

import java.util.List;

public interface AttendanceStateMapper {
    List<AttendanceState> find();

    int deleteByPrimaryKey(Long id);

    int insert(AttendanceState record);

    int insertSelective(AttendanceState record);

    AttendanceState selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AttendanceState record);

    int updateByPrimaryKey(AttendanceState record);
}