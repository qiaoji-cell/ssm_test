package com.axjy.service.sys;

import com.axjy.pojo.sys.Role;
import com.axjy.vo.sys.QuickQueryVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Joe on 2021/10/19 下午 18:02
 */
public interface RoleService {
    PageInfo findAllRole(QuickQueryVo vo);

    //删除角色信息 确认有没有用户
    void delRole(Long[] ids);

    //更新角色 校验角色名称
    void updateRole(Role role);

    void addRole(Role role);

    Integer findByRoleName(String name,Long gardenId,Long roleId);

    List<Role> findAllList(Long gardenId);

    List<Role> findByUid(Long uid);

}
