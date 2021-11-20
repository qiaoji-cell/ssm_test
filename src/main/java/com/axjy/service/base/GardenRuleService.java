package com.axjy.service.base;

import com.axjy.pojo.base.GardenRule;

/**
 * Created by Joe on 2021/10/30 下午 09:54
 */
public interface GardenRuleService {
    void delRule(Long gardenId);

    GardenRule findByGardenId(Long gardenId);

    void addRule(GardenRule gardenRule);
}
