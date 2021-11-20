package com.axjy.mapper.sys;

import com.axjy.pojo.sys.UserGarden;
import org.apache.ibatis.annotations.Param;

public interface UserGardenMapper {
    Long findGardenIdByUId(Long uId);

    int countUserByGardenId(Long gardenId);

    int delete(@Param("garden") UserGarden garden);
    int insert(UserGarden record);

    int insertSelective(UserGarden record);

    void batchDel(@Param("garden") UserGarden garden);
}