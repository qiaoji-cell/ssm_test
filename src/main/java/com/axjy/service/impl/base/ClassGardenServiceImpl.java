package com.axjy.service.impl.base;

import com.axjy.mapper.base.ClassGardenMapper;
import com.axjy.pojo.base.ClassGarden;
import com.axjy.service.base.ClassGardenService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/29 下午 19:16
 */
@Service("classGardenService")
public class ClassGardenServiceImpl implements ClassGardenService {
    @Resource
    private ClassGardenMapper classGardenMapper;
    @Override
    public void addRelation(ClassGarden relation) {
        classGardenMapper.addRelation(relation);
    }

    @Override
    public void delRelation(ClassGarden relation) {
        classGardenMapper.delRelation(relation);
    }
}
