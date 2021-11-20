package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.PosGardenMapper;
import com.axjy.pojo.sys.PosGarden;
import com.axjy.service.sys.PosGardenService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/22 下午 14:39
 */
@Service("posGardenService")
public class PosGardenServiceImpl implements PosGardenService {
    @Resource
    private PosGardenMapper posGardenMapper;

    @Override
    public void addPosRelation(PosGarden posGarden) {
        posGardenMapper.insert(posGarden);
    }

    @Override
    public void delPosRelation(Long gardenId,Long[] ids) {
        posGardenMapper.delete(gardenId,ids);
    }
}
