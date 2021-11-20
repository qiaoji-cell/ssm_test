package com.axjy.mapper;

import com.axjy.pojo.ChargeType;

import java.util.List;

public interface ChargeTypeMapper {

    List<ChargeType> findAll();

    int deleteByPrimaryKey(Long id);

    int insert(ChargeType record);

    int insertSelective(ChargeType record);

    ChargeType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ChargeType record);

    int updateByPrimaryKey(ChargeType record);
}