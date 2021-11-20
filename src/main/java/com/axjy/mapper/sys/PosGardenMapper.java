package com.axjy.mapper.sys;

import com.axjy.pojo.sys.PosGarden;
import org.apache.ibatis.annotations.Param;

public interface PosGardenMapper {
    int insert(PosGarden record);

    int delete(@Param("gardenId")Long gardenId,@Param("ids")Long[] ids);

    int insertSelective(PosGarden record);
}