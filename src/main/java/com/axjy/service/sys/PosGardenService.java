package com.axjy.service.sys;

import com.axjy.pojo.sys.PosGarden;

/**
 * Created by Joe on 2021/10/22 下午 14:38
 */
public interface PosGardenService{
    void addPosRelation(PosGarden posGarden);

    void delPosRelation(Long gardenId,Long[] ids);
}
