package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.DepGardenMapper;
import com.axjy.pojo.sys.DepGarden;
import com.axjy.service.sys.DepGardenService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/22 下午 12:06
 */
@Service("depGardenService")
public class DepGardenServiceImpl implements DepGardenService {
    @Resource
    private DepGardenMapper depGardenMapper;

    @Override
    public void addRelation(DepGarden record) {
        depGardenMapper.insert(record);
    }

    @Override
    public void delRelation(DepGarden record) {
        depGardenMapper.delete(record);
    }
}
