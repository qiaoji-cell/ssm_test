package com.axjy.mapper.base;

import com.axjy.pojo.base.Garden;
import com.axjy.vo.base.CodeNameVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GardenMapper {
    //查询所有园所
    List<Garden> findAll(@Param("field")String field, @Param("value")String value);
    //通过编码查询园所
    Garden findByCode(CodeNameVo codeNameVo);
    //通过名称查询园所
    Garden findByName(CodeNameVo codeNameVo);
    //批量删除
    int batchDel(Long[] ids);

    int deleteByPrimaryKey(Long id);

    int insert(Garden record);

    int insertSelective(Garden record);

    Garden selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Garden record);

    int updateByPrimaryKey(Garden record);
}