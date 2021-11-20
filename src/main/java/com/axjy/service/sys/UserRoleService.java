package com.axjy.service.sys;

import com.axjy.pojo.sys.User;
import com.axjy.pojo.sys.UserRole;

/**
 * Created by Joe on 2021/10/23 下午 15:14
 */
public interface UserRoleService {

    void addRelation(UserRole relation);

    void batchAddRelation(UserRole relation);

    void batchDelRelation(UserRole relation);

    void deleteRelation(UserRole relation);
}
