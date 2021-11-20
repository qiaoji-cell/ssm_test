package com.axjy.mapper.child;

import com.axjy.pojo.child.ChildRemind;
import com.axjy.vo.child.ChildVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChildRemindMapper {

    List<ChildRemind> queryLimit(Long gardenId);
    List<ChildRemind> find(@Param("childVo")ChildVo childVo);

    int deleteByPrimaryKey(Long id);

    int insert(ChildRemind record);

    int insertSelective(ChildRemind record);

    ChildRemind selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ChildRemind record);

    int updateByPrimaryKey(ChildRemind record);
}