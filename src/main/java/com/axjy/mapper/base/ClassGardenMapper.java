package com.axjy.mapper.base;

import com.axjy.pojo.base.ClassGarden;
import org.apache.ibatis.annotations.Param;

public interface ClassGardenMapper {

    //删除 班级园所的关系
    void delRelation(@Param("classGarden")ClassGarden classGarden);

    //添加 班级园所的关系
    void addRelation(@Param("classGarden")ClassGarden classGarden);

    int insert(ClassGarden record);

    int insertSelective(ClassGarden record);
}