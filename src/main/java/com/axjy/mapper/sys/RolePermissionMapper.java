package com.axjy.mapper.sys;

import com.axjy.pojo.sys.Permission;
import com.axjy.pojo.sys.RolePermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RolePermissionMapper {
    void addRolePermissionByRole(@Param("roleId") Long roleId,@Param("perIds") String[] perIds);

    void delRolePermissionByRole(Long roleId);

    void delRolePermissionByRoles(Long[] roleId);

    List<Long> findPermIdByRole(Long roleId);

    //批量新增
    void batchAdd(@Param("idList")List<Integer> idList, @Param("roleId")Long roleId);

    //批量删除
    void batchDelPerm(List<Permission> childPerm);

    //查询有没有一个在父菜单下所有子菜单的关系
    int countChild(List<Permission> childPerm);
    //查询关系表里有没有父级菜单的关系
    int countParent(Long parentId);
    //插入父节点权限和角色
    void insertRoleParent(@Param("roleId")Long roleId,@Param("parentId")Long parentId);

    void deleteByPermId(Long permId);

    int deleteByPrimaryKey(Long id);

    int insert(RolePermission record);

    int insertSelective(RolePermission record);

    RolePermission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RolePermission record);

    int updateByPrimaryKey(RolePermission record);
}