package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.UserGardenMapper;
import com.axjy.pojo.sys.UserGarden;
import com.axjy.service.sys.UserGardenService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/23 下午 14:57
 */
@Service("userGardenService")
public class UserGardenServiceImpl implements UserGardenService {
    @Resource
    private UserGardenMapper userGardenMapper;

    @Override
    public Long findGardenIdByUId(Long uId) {
        return userGardenMapper.findGardenIdByUId(uId);
    }

    @Override
    public Integer countUserByGardenId(Long gardenId) {
        return userGardenMapper.countUserByGardenId(gardenId);
    }

    @Override
    public void addRelation(UserGarden userGarden) {
        userGardenMapper.insert(userGarden);
    }


    @Override
    public void delRelation(UserGarden userGarden) {
        userGardenMapper.delete(userGarden);
    }

    @Override
    public void batchDelRelation(UserGarden userGarden) {
        userGardenMapper.batchDel(userGarden);
    }
}
