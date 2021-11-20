package com.axjy.mapper.sys;

import com.axjy.pojo.sys.UserRole;
import org.apache.ibatis.annotations.Param;

public interface UserRoleMapper {
    int delete(@Param("userRole") UserRole userRole);

    int batchDel(@Param("userRole") UserRole userRole);

    int deleteByPrimaryKey(Long id);

    int insert(UserRole record);

    int batchInsert(@Param("userRole")UserRole role);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}