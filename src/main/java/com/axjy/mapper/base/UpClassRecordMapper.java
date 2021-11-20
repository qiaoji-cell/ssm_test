package com.axjy.mapper.base;

import com.axjy.pojo.base.UpClassRecord;

import java.util.List;

public interface UpClassRecordMapper {

    List<UpClassRecord> findAllByUserCode(String userCode);

    int deleteByPrimaryKey(Long id);

    int insert(UpClassRecord record);

    int insertSelective(UpClassRecord record);

    UpClassRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UpClassRecord record);

    int updateByPrimaryKey(UpClassRecord record);
}