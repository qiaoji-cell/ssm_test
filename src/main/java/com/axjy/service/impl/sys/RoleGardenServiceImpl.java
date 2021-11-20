package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.RoleGardenMapper;
import com.axjy.pojo.sys.RoleGarden;
import com.axjy.service.sys.RoleGardenService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/22 下午 17:53
 */
@Service("roleGardenService")
public class RoleGardenServiceImpl implements RoleGardenService {
    @Resource
    private RoleGardenMapper roleGardenMapper;
    @Override
    public void addRelation(RoleGarden roleGarden) {
        roleGardenMapper.insert(roleGarden);
    }

    @Override
    public void delRelation(Long gardenId,Long[] roleIds) {
        roleGardenMapper.delete(gardenId,roleIds);
    }
}
