package com.axjy.mapper.sys;

import com.axjy.pojo.sys.Permission;

import java.util.List;
import java.util.Set;

public interface PermissionMapper {

    Permission findParentIdByPermId(Long parentId);

    List<Permission> findAll(Integer userId);

    List<Permission> findByNoCondition();

    Set<String> findAllPermCodes(Integer userId);

    List<String> findPermCodesByRoleId(Integer roleId);

    List<Permission> findByRoleId(Integer roleId);

    int count(Long parentId);

    List<Permission> countPerm(Long parentId);

    List<Integer> countPermId(Long parentId);

    int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
}