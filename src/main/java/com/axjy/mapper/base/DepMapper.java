package com.axjy.mapper.base;

import com.axjy.pojo.sys.Dep;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepMapper {

    Integer findByParentId(Long depId);

    Object findByCode(@Param("code") String code,
                      @Param("depId")Long depId,
                      @Param("gardenId")Long gardenId);

    Object findByName(@Param("name")String name,
                      @Param("depId")Long depId,
                      @Param("gardenId")Long gardenId);


    List<Dep> findAll(Long gardenId);

    int deleteByPrimaryKey(Long id);

    int insert(Dep record);

    int insertSelective(@Param("record") Dep record, @Param("gardenId")Long gardenId);

    Dep selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Dep record);

    int updateByPrimaryKey(Dep record);
}