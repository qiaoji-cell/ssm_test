package com.axjy.mapper.sys;

import com.axjy.pojo.sys.Business;

public interface BusinessMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);
}