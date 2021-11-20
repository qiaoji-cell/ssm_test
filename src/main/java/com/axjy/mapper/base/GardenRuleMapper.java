package com.axjy.mapper.base;

import com.axjy.pojo.base.GardenRule;

public interface GardenRuleMapper {

    void delRule(Long gardenId);
    GardenRule findByGardenId(Long gardenId);

    int deleteByPrimaryKey(Long id);

    int insert(GardenRule record);

    int insertSelective(GardenRule record);

    GardenRule selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GardenRule record);

    int updateByPrimaryKey(GardenRule record);
}