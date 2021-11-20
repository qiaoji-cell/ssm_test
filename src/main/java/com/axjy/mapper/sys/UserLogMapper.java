package com.axjy.mapper.sys;

import com.axjy.pojo.sys.UserLog;
import com.axjy.vo.log.LogQueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserLogMapper {
    List<UserLog> findAll(@Param("vo")LogQueryVo vo);

    Integer countTime(String userCode);

    int deleteByPrimaryKey(Long id);

    int insert(UserLog record);

    int insertSelective(UserLog record);

    UserLog selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserLog record);

    int updateByPrimaryKey(UserLog record);
}