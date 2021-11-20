package com.axjy.service.sys;

import com.axjy.pojo.sys.Permission;
import com.axjy.vo.sys.ZTreeVo;

import java.util.List;
import java.util.Set;

/**
 * Created by Joe on 2021/10/11 下午 16:18
 */
public interface PermissionService {
    Set<String> findAllPermCodes(Integer userId);

    List<Permission> findAllPermission(Integer userId);

    List<ZTreeVo> findByNoCondition();

    List<Permission> findByRoleId(Integer roleId);

    List<ZTreeVo> findCheckPermission(Integer roleId);

}
