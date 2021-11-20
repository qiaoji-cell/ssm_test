package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.UserRoleMapper;
import com.axjy.pojo.sys.UserRole;
import com.axjy.service.sys.UserRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/10/23 下午 15:15
 */
@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {
    @Resource
    private UserRoleMapper userRoleMapper;
    @Override
    public void addRelation(UserRole relation) {
        userRoleMapper.insert(relation);
    }

    @Override
    public void batchAddRelation(UserRole relation) {
        userRoleMapper.batchInsert(relation);
    }

    @Override
    public void batchDelRelation(UserRole relation) {
        userRoleMapper.batchDel(relation);
    }


    @Override
    public void deleteRelation(UserRole relation) {
        userRoleMapper.delete(relation);
    }
}
