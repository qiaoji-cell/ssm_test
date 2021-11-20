package com.axjy.service.sys;

import com.axjy.pojo.sys.UserGarden;

/**
 * Created by Joe on 2021/10/23 下午 14:55
 */
public interface UserGardenService {
    Long findGardenIdByUId(Long uId);

    Integer countUserByGardenId(Long gardenId);

    void addRelation(UserGarden userGarden);

    void delRelation(UserGarden userGarden);

    void batchDelRelation(UserGarden userGarden);
}
