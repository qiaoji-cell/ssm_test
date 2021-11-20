package com.axjy.service.impl.base;

import com.axjy.mapper.base.GardenMapper;
import com.axjy.mapper.base.GardenRuleMapper;
import com.axjy.pojo.base.GardenRule;
import com.axjy.service.base.GardenRuleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/30 下午 09:55
 */
@Service("gardenRuleService")
public class GardenRuleServiceImpl implements GardenRuleService {
    @Resource
    private GardenRuleMapper gardenRuleMapper;

    @Override
    public void delRule(Long gardenId) {
        gardenRuleMapper.delRule(gardenId);
    }

    @Override
    public GardenRule findByGardenId(Long gardenId) {
        return gardenRuleMapper.findByGardenId(gardenId);
    }

    @Override
    public void addRule(GardenRule gardenRule) {
        gardenRuleMapper.insert(gardenRule);
    }
}
