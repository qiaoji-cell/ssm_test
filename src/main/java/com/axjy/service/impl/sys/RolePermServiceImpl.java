package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.PermissionMapper;
import com.axjy.mapper.sys.RolePermissionMapper;
import com.axjy.pojo.sys.Permission;
import com.axjy.pojo.sys.RolePermission;
import com.axjy.service.sys.RolePermService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/20 下午 14:54
 */
@Service("rolePermService")
@Slf4j
public class RolePermServiceImpl implements RolePermService {

    @Resource
    private RolePermissionMapper rolePermissionMapper;
    @Resource
    private PermissionMapper permissionMapper;


    /**
     * 删除子节点的子节点
     * 通过子节点列表的每一个子节点 找寻对应子节点然后删除
     * @param childList
     */
    public void delChildPerm(List<Permission> childList){
        log.info("要删除的子集合{}",childList);

        rolePermissionMapper.batchDelPerm(childList);
        //有子节点  删除所有子节点的权限角色关系
        for(Permission perm:childList){
            List<Permission> childItem =  permissionMapper.countPerm(perm.getId());
            System.out.println(childItem);
            //子权限集合不为空存在的话进行 批量删除
            if(childItem.size()>0){
                delChildPerm(childItem);
            }
        }

    }

    public void delParentParentPerm(List<Permission> childList, Long parentId){
        // 然后在关系表里count()有没有in // 查找它所有子节点 有没有在关系表里存在
        int childCount = rolePermissionMapper.countChild(childList);
        System.out.println("统计要删除父节点的子节点数量"+childCount);
        if(childCount==0) {
            //删除前找到当条父权限的对象 //通过父权限id找到父权限对象
            Permission currPermObj = permissionMapper.findParentIdByPermId(parentId);
            //没有 in 就是没有一个父菜单的任何一个子菜单的 关系
            //就可以删除父菜单的关系
            rolePermissionMapper.deleteByPermId(parentId);

            //不是顶级权限 接着往上找 删除上面的关系
            if (parentId != -1) {
                List<Permission> kmsChildItems = permissionMapper.countPerm(currPermObj.getParentId());
                // 有没子节点关系 在关系表
                // 没有的话删除 删除关系
                // 有子节点的集合
                System.out.println("有集合数量 并大于0");
                delParentParentPerm(kmsChildItems,currPermObj.getParentId());
            } else {
                //是顶层删除单个关系
                rolePermissionMapper.deleteByPermId(parentId);
            }
        }
    }


//    // 然后在关系表里count()有没有in
//    int childCount = rolePermissionMapper.countChild(childList);
//        System.out.println("有没有父权限的子权限");
//        System.out.println(childCount);
//        if(childCount==0){
//        //删除前找到当条父权限的对象 //通过父权限id找到父权限对象
//        Permission currPermObj = permissionMapper.findParentIdByPermId(parentId);
//        //没有 in 就是没有一个父菜单的任何一个子菜单的 关系
//        //就可以删除父菜单的关系
//        rolePermissionMapper.deleteByPermId(parentId);
//
//        //不是顶级权限 接着往上找 删除上面的关系
//        if(parentId!=-1){
//            List<Permission> kmsChildItems = permissionMapper.countPerm(currPermObj.getParentId());
//            // 查找它所有子节点 有没有在关系表里存在
//            int childRelation = rolePermissionMapper.countChild(childList);
////                delChildPerm(kmsChildItems);
//            // 有没子节点关系 在关系表
//            // 没有的话删除 删除关系
//        }else{
//
//        }
//
//
//    }


    @Override
    public void delRolePermissions(Long roleId) {
        rolePermissionMapper.delRolePermissionByRole(roleId);
    }

    @Override
    public void delRolePermissions(Long[] roleIds) {
        rolePermissionMapper.delRolePermissionByRoles(roleIds);
    }

    @Override
    public void addRolePermissions(Long roleId, String[] perIds) {
       rolePermissionMapper.addRolePermissionByRole(roleId,perIds);
    }

    @Override
    public List<Long> findPermIdByRole(Long roleId) {
        return rolePermissionMapper.findPermIdByRole(roleId);
    }

    //删除父节点关系
    @Override
    public void delByPermId(Long permId,Long parentId) {

        //如果删除的id是目录它下面有节点 删除下面节点的权限关系
        int count = permissionMapper.count(permId);
        if(count > 0){
            //有子节点  删除所有子节点以及子节点对应子节点的权限角色关系
            List<Permission> childList =  permissionMapper.countPerm(permId);
            delChildPerm(childList);
            //通过子节点列表 删除关系表的子节点
            rolePermissionMapper.batchDelPerm(childList);
            System.out.println("递归出来了");
        }

        //这里是删除子节点操作的分隔线======================================================

        log.info("删除子节点的操作结束了，轮到父节点了");
        //关闭所有子节点 父节点删除 通过同一个父权限进行判断 在权限关系里没有找到子权限
        //先通过父节点找寻所有子节点
        List<Permission> childList =  permissionMapper.countPerm(parentId);

        delParentParentPerm(childList,parentId);
        //是不是子节点 都得删除当前的子节点
        rolePermissionMapper.deleteByPermId(permId);

    }


    /**
     * 添加父节点的父节点关系
     * @param parentItem 父节点权限对象
     * @param roleId
     */
    public void addParentParentRelation(Permission parentItem, Long roleId){
        int countParent = rolePermissionMapper.countParent(parentItem.getParentId());
        //不是最顶级节点 并且父级节点没有在关系表存在
        if(parentItem.getParentId()!=-1&&countParent==0){
            //插入父节点的关系
            rolePermissionMapper.insertRoleParent(roleId,parentItem.getParentId());
            //找寻父节点的整条数据 寻找它的父节点
            System.out.println("父节点"+parentItem.getParentId());
            Permission pItem = permissionMapper.findParentIdByPermId(parentItem.getParentId());
            //递归添加父节点
            addParentParentRelation(pItem,roleId);
        }else{
            //开启当前item节点 添加关系
            rolePermissionMapper.insertRoleParent(roleId,parentItem.getId());
        }
    }
    /**
     * 添加父级节点id的关系
     * @param krp 父节点 以及角色id
     */
    public void addParentRelation(RolePermission krp){
        int countParent = rolePermissionMapper.countParent(krp.getParentId());
        //找寻父节点的整条数据 寻找它的父节点
        Permission parentItem = permissionMapper.findParentIdByPermId(krp.getParentId());
        if(krp.getParentId()!=-1&&countParent==0){
            //插入父节点的关系
            rolePermissionMapper.insertRoleParent(krp.getRoleId(),krp.getParentId());
        }
        //如果通过父节点找到当前节点不为空 执行递归添加多层父级
        if(parentItem!=null){
            addParentParentRelation(parentItem,krp.getRoleId());
        }
    }

    /**
     * 批量新增子节点以及子节点权限关系
     * @param childList 子权限集合
     * @param childPermIdList 子权限permId集合
     * @param roleId 角色id
     */
    public void addChildRelation(List<Permission> childList, List<Integer> childPermIdList, Long roleId){
        //批量新增
        rolePermissionMapper.batchAdd(childPermIdList,roleId);
        for(Permission perm:childList){
            //有子节点 添加所有角色和子节点的权限关系 通过id集合
            List<Integer> childPermId =  permissionMapper.countPermId(perm.getId());
            //有子节点 找到子节点集合并遍历它 找他下面子节点集合的子节点
            List<Permission> childPermItem = permissionMapper.countPerm(perm.getId());
            //有的话递归添加关系
            if(childPermItem.size()>0){
                addChildRelation(childPermItem,childPermId,roleId);
            }
        }
    }


    @Override
    public void addNew(RolePermission krp) {
        //1.启用一个子节点 父节点启用 向上追寻父节点的启用
         addParentRelation(krp);
        //如果不是顶级菜单权限 就可以进行父节点的启用 并且该父节点在关系表不存在
        int countParent = rolePermissionMapper.countParent(krp.getParentId());
        if(krp.getParentId()!=-1&&countParent==0){
            //插入父节点的关系
            rolePermissionMapper.insertRoleParent(krp.getRoleId(),krp.getParentId());
        }
        //2.启用一个父节点 所有子节点启用
        //有子节点  删除所有子节点的权限角色关系
        //如果开启的权限id是目录它下面有节点 启用下面全部节点的权限关系
        int count = permissionMapper.count(krp.getPermId());//子节点数量
        if(count>0){
            //有子节点 添加所有角色和子节点的权限关系
            List<Integer> childList =  permissionMapper.countPermId(krp.getPermId());
//            //批量新增
//            rolePermissionMapper.batchAdd(childList,krp.getRoleId());
            //添加子节点中 每一个包含子节点的子节点关系 并且关系列表中没有该子节点的关系
            List<Permission> childPermList = permissionMapper.countPerm(krp.getPermId());
            addChildRelation(childPermList,childList,krp.getRoleId());
        }

        //都得新增当前菜单权限的关系
        rolePermissionMapper.insert(krp);
    }
}
