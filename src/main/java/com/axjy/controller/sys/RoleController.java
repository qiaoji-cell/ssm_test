package com.axjy.controller.sys;

import com.axjy.pojo.sys.Role;
import com.axjy.pojo.sys.RolePermission;
import com.axjy.pojo.sys.RoleGarden;
import com.axjy.pojo.sys.User;
import com.axjy.service.sys.*;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import com.axjy.vo.sys.QuickQueryVo;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Joe on 2021/10/19 下午 18:14
 */
@RestController
@RequestMapping("sys")
public class RoleController {

    @Resource
    private RoleService roleService;
    @Resource
    private PermissionService permissionService;
    @Resource
    private RolePermService rolePermService;

    @Resource
    private RoleGardenService roleGardenService;
    @Resource
    private UserService userService;

    //查询指定机构（总部、分园）的所有角色
    @GetMapping("/role/select")
    public Result roleSelect(Long gardenId){
        List<Role> roleList = roleService.findAllList(gardenId);
        return Result.success(roleList);
    }

    @GetMapping("/role/list")
    public Result roleList(QuickQueryVo vo, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        if(vo.getGardenId()==null){
            vo.setGardenId(1L);
        }
        PageInfo pageInfo = roleService.findAllRole(vo);
        return Result.success(pageInfo);
    }

    //添加角色
    @PostMapping("/role/add")
    public Result roleAdd(Role role, Long gardenId){
        try {
            //添加前验证该角色名称是否存在
            Integer integer = roleService.findByRoleName(role.getRoleName(),gardenId,null);
            if(integer>0){
                return Result.failed("用户角色名已存在，请重新输入");
            }
            //添加角色
            roleService.addRole(role);
            //添加角色关系
            RoleGarden roleGarden = new RoleGarden();
            roleGarden.setGardenId(gardenId);
            roleGarden.setRoleId(role.getId());
            //添加角色园所关系
            roleGardenService.addRelation(roleGarden);

        } catch (Exception e) {
            return Result.failed("新增失败！");
        }
        return Result.success("新增成功！");
    }
    //添加页面
    @GetMapping("/role/add")
    public ModelAndView roleAdd(){
        return new ModelAndView("/sys/role/add");
    }

    //修改页面
    @GetMapping("/role/edit")
    public ModelAndView roleUpdate(){
        return new ModelAndView("/sys/role/edit");
    }
    @PostMapping("/role/edit")
    public Result roleUpdate(Role role){
        if(role.getId()==1){
            return Result.failed("避免误操作，禁止修改超级管理员信息");
        }
        try {
            roleService.updateRole(role);
        } catch (Exception e) {
            return Result.failed("更新失败！");
        }
        return Result.success("更新成功！");
    }

    @PostMapping("/role/del")
    public Result roleDel(Long[] roleIds,Long gardenId){
        //删除前确认该角色有没有分配人员 从用户表 用户角色关系表 查询有没有该角色的id
        if(roleIds[0]==1){
            return Result.failed("避免误操作，禁止修改超级管理员权限");
        }
        if(userService.countRoleUser(roleIds[0])>0){
            return Result.failed("删除失败！该角色已拥有人员");
        }

        try {
            //批量删除角色园所关系
            roleGardenService.delRelation(gardenId,roleIds);
            //批量删除角色权限关系
            rolePermService.delRolePermissions(roleIds);
            //删除角色
            roleService.delRole(roleIds);

        } catch (Exception e) {
            System.out.println(e);
            return Result.failed("删除失败！");
        }
        return Result.success("删除成功！");
    }

    //角色权限
    @GetMapping("/role/permission")
    public ModelAndView rolePermission(){
        return new ModelAndView("sys/role/permission");
    }

    //获取所有权限
    @GetMapping("/role/permissionList")
    public Result roleAllPermission(){

        return Result.success(permissionService.findByNoCondition(),"查询成功");
    }

    //获取所有指定角色的权限id
    @GetMapping("/role/rolePermission")
    public Result roleAppointPerm(Long roleId){
        return Result.success(rolePermService.findPermIdByRole(roleId),"查询成功！");
    }
    //添加指定角色的权限关系
    @PostMapping("/role/assignPers")
    public Result roleAssignPers(Long roleId,@RequestParam(value = "perIds",defaultValue = "") String[] perIds){
        //如果角色是超级管理员禁止修改

        if(roleId==null){
            return Result.failed("请选择角色");
        }
        if(roleId==1){
            return Result.failed("避免误操作，禁止修改超级管理员权限");
        }
        try {
            //删除该角色的所有权限
            rolePermService.delRolePermissions(roleId);
            //有选中的权限 批量添加
            if(perIds.length>0){
                rolePermService.addRolePermissions(roleId,perIds);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("授权失败!");
        }
        return Result.success("授权成功!");
    }

    //修改指定角色的权限 暂时弃用
    @PostMapping("/role/permUpdate")
    public Result permUpdate(RolePermission krs){
        Result result = null;
        //在权限角色关系表里找到指定角色 删除权限  状态为true 删除 false 添加
        if(krs.isCurrState()){
            try {
                //删除权限关系表的权限
                rolePermService.delByPermId(krs.getPermId(),krs.getParentId());
              result= Result.success("禁用权限成功!");
            } catch (Exception e) {
                System.out.println(e);
                result= Result.success("禁用权限失败！"+e.getMessage());
            }
        }else{
            try {
                //添加权限
                //往权限关系表里添加角色id 和 权限id
                rolePermService.addNew(krs);
                result= Result.success("启用权限成功！");
            } catch (Exception e) {
                e.printStackTrace();
                result=Result.failed("启用权限失败！");
            }
        }
        return result;
    }
}
