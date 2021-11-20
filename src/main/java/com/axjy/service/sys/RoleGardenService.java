package com.axjy.service.sys;

import com.axjy.pojo.sys.RoleGarden;

/**
 * Created by Joe on 2021/10/22 下午 17:51
 */
public interface RoleGardenService {

    void addRelation(RoleGarden roleGarden);

    void delRelation(Long gardenId,Long[] roleIds);
}
