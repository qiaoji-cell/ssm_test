package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.PermissionMapper;
import com.axjy.pojo.sys.Permission;
import com.axjy.service.sys.PermissionService;
import com.axjy.utils.ZTreeUtil;
import com.axjy.vo.sys.ZTreeVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by Joe on 2021/10/11 下午 16:19
 */
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {
    @Resource
    private PermissionMapper permissionMapper;

    @Override
    public Set<String> findAllPermCodes(Integer userId) {
        return permissionMapper.findAllPermCodes(userId);
    }


    @Override
    public List<Permission> findAllPermission(Integer userId) {
        return permissionMapper.findAll(userId);
    }

    @Override
    public List<ZTreeVo> findByNoCondition() {

        List<Permission> permissionList = permissionMapper.findByNoCondition();
        List<ZTreeVo> voList = new ArrayList<>();
        for (Permission perm:permissionList){

            if(perm.getId()!=4&&
            perm.getId()!=5&&perm.getId()!=7
            &&perm.getId()!=44
                    &&perm.getId()!=45
                    &&perm.getId()!=46
                    &&perm.getId()!=48
                    &&perm.getId()!=50
                    &&perm.getId()!=52
                    &&perm.getId()!=64
                    &&perm.getId()!=44){
                ZTreeVo vo = new ZTreeVo();
                vo.setId(perm.getId());
                vo.setPId(perm.getParentId());
                vo.setName(perm.getPermName());
                voList.add(vo);
            }


        }
        return ZTreeUtil.toTree(voList,-1L);
    }

    @Override
    public List<Permission> findByRoleId(Integer roleId) {
        return permissionMapper.findByRoleId(roleId);
    }

    @Override
    public List<ZTreeVo> findCheckPermission(Integer roleId) {
        //找到所有指定角色的所有权限码
        List<Permission> permissionList = permissionMapper.findByRoleId(roleId);

        List<ZTreeVo> voList = new ArrayList<>();
        for (Permission perm:permissionList){
            ZTreeVo vo = new ZTreeVo();
            vo.setId(perm.getId());
            vo.setPId(perm.getParentId());
            vo.setName(perm.getPermName());
            voList.add(vo);
        }


//        找到所有权限的列表
        List<Permission> allPermission = permissionMapper.findByNoCondition();

        //遍历所有列表对比权限码 有的话把isHave布尔赋值成true
        for(Permission permission :allPermission) {
            String permCode = permission.getPermCode();
            if(permissionList.contains(permCode)){
                permission.setHave(true);
            }
        }
        return ZTreeUtil.toTree(voList,-1L);
    }


}
