package com.axjy.mapper.teach;

import com.axjy.pojo.teach.Classmodel;
import com.axjy.vo.teach.ClassmodelVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassmodelMapper {

    List<Classmodel> find(@Param("classmodelVo") ClassmodelVo classmodelVo);

    int deleteByPrimaryKey(Long id);

    int insert(Classmodel record);

    int insertSelective(Classmodel record);

    Classmodel selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Classmodel record);

    int updateByPrimaryKey(Classmodel record);
}