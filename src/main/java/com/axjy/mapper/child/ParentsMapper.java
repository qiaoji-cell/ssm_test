package com.axjy.mapper.child;

import com.axjy.pojo.child.Parents;
import org.apache.ibatis.annotations.Param;

public interface ParentsMapper {

    Parents find(@Param("studentCode") String studentCode);

    int update(Parents parents);

    int delete(String studentCode);

    int deleteByPrimaryKey(Long id);

    int insert(Parents record);

    int insertSelective(Parents record);

    Parents selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Parents record);

    int updateByPrimaryKey(Parents record);
}