package com.axjy.mapper.teach;

import com.axjy.pojo.teach.Register;

import java.util.List;

public interface RegisterMapper {

    int query(Long student_id);

    List<Register> find(Long classModelId);

    int deleteByPrimaryKey(Long id);

    int insert(Register record);

    int insertSelective(Register record);

    Register selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Register record);

    int updateByPrimaryKey(Register record);
}