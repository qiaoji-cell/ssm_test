package com.axjy.service.sys;

import com.axjy.pojo.sys.RolePermission;

import java.util.List;

/**
 * Created by Joe on 2021/10/20 下午 14:53
 */
public interface RolePermService {
    void delRolePermissions(Long roleId);

    void delRolePermissions(Long[] roleIds);

    void addRolePermissions(Long roleId,String[] perIds);

    List<Long> findPermIdByRole(Long roleId);

    void delByPermId(Long id,Long parentId);

    void addNew(RolePermission vo);
}
