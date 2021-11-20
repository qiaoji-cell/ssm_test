package com.axjy.service.impl;

import com.axjy.mapper.ChargeTypeMapper;
import com.axjy.pojo.ChargeType;
import com.axjy.service.ChargeTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("kmschargetypeservice")
public class ChargeTypeServiceImpl implements ChargeTypeService {

    @Resource
    private ChargeTypeMapper chargetypeMapper;

    @Override
    public List<ChargeType> findAll() {
        return chargetypeMapper.findAll();
    }
}
