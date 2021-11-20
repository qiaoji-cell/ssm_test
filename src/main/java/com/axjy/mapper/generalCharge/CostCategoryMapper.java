package com.axjy.mapper.generalCharge;

import com.axjy.pojo.generalCharge.CostCategory;

import java.util.List;

public interface CostCategoryMapper {
    List<CostCategory> findAll();

    int deleteByPrimaryKey(Long id);

    int insert(CostCategory record);

    int insertSelective(CostCategory record);

    CostCategory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CostCategory record);

    int updateByPrimaryKey(CostCategory record);
}