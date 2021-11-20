package com.axjy.mapper.sys;

import com.axjy.pojo.sys.RoleGarden;
import org.apache.ibatis.annotations.Param;

public interface RoleGardenMapper {
    int insert(RoleGarden record);

    int delete(@Param("gardenId") Long gardenId, @Param("roleIds") Long[] ids);

    int insertSelective(RoleGarden record);
}