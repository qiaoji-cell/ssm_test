package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.RoleMapper;
import com.axjy.pojo.sys.Role;
import com.axjy.service.sys.RoleService;
import com.axjy.vo.sys.QuickQueryVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/19 下午 18:08
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;
    @Override
    public PageInfo findAllRole(QuickQueryVo vo) {
        PageHelper.startPage(vo.getPage(),vo.getLimit());
        List<Role> list = roleMapper.findAllRole(vo);
        PageInfo info = new PageInfo(list);
        return info;
    }

    @Override
    public void delRole(Long[] ids) {
        roleMapper.batchDel(ids);
    }

    @Override
    public void updateRole(Role role) {
        roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public void addRole(Role role) {
        roleMapper.insertSelective(role);
    }

    @Override
    public Integer findByRoleName(String name,Long gardenId,Long roleId) {
        return roleMapper.findByName(name,gardenId,roleId);
    }

    @Override
    public List<Role> findAllList(Long gardenId) {
        return roleMapper.findAllList(gardenId);
    }

    @Override
    public List<Role> findByUid(Long uid) {
        return roleMapper.findByUid(uid);
    }
}
