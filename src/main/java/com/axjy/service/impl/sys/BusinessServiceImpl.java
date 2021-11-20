package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.BusinessMapper;
import com.axjy.pojo.sys.Business;
import com.axjy.service.sys.BusinessService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/17 下午 21:03
 */
@Service("businessService")
public class BusinessServiceImpl implements BusinessService {
    @Resource
    private BusinessMapper businessMapper;

    @Override
    public Business findById(Long id) {
        return businessMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateComp(Business business) {
        businessMapper.updateByPrimaryKeySelective(business);
    }
}
