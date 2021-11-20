package com.axjy.mapper.sys;

import com.axjy.pojo.sys.Pos;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PosMapper {
    List<Pos> findAll(@Param("field")String field,
                      @Param("value")String value,
                      @Param("gardenId")Long gardenId);

    Pos findByName(@Param("name")String name
                        , @Param("gardenId")Long gardenId
                        , @Param("posId")Long posId);

    void batchDel(Long[] ids);

    int deleteByPrimaryKey(Long id);

    int insert(Pos record);

    int insertSelective(Pos record);

    Pos selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Pos record);

    int updateByPrimaryKey(Pos record);
}