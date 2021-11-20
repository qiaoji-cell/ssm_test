package com.axjy.mapper.sys;

import com.axjy.pojo.sys.DepGarden;
import org.apache.ibatis.annotations.Param;

public interface DepGardenMapper {

    int insert(DepGarden record);

    int delete(@Param("record") DepGarden record);

    int insertSelective(DepGarden record);
}