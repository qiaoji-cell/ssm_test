package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.RoleMapper;
import com.axjy.mapper.sys.UserMapper;
import com.axjy.pojo.sys.Role;
import com.axjy.pojo.sys.User;
import com.axjy.service.sys.UserService;
import com.axjy.vo.base.SettingQuery;
import com.axjy.vo.sys.QueryUserVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.SneakyThrows;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Joe on 2021/09/26 上午 9:23
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private RoleMapper roleMapper;

    @Override
    public String findApprovalPerson() {
        List<User> users = userMapper.findApprovalPerson();
        String userNames = "";
        for (int i = 0; i < users.size(); i++) {
            userNames+= users.get(i).getUserName();
            if(i!=users.size()-1){
                userNames+=",";
            }
            System.out.println(userNames);
        }

        return userNames;
    }

    @Override
    public int countUser(Long gardeId) {
        return userMapper.countUser(gardeId);
    }


    @Override
    public void updateClassId(Integer classId,String userCode) {
        userMapper.updateClassId(classId,userCode);
    }

    @Override
    public void UpdateState(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public PageInfo findSettingUser(SettingQuery vo) {
        PageHelper.startPage(vo.getPage(),vo.getLimit());
        List<User>  userList =  userMapper.findSettingUser(vo);
        userList.removeIf(user -> user.getId()==1);
        PageInfo pageInfo = new PageInfo(userList);
        return pageInfo;
    }

    @Override
    public int addUser(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public User findByUserCode(String userCode) {
        return userMapper.selectByUserCode(userCode);
    }

    @Override
    public Integer findByCode(String userCode,Long userId) {
        return userMapper.findByCode(userCode,userId);
    }


    @Override
    public boolean updateUser(Integer userId, String userPwd) {
        return userMapper.updatePwd(userPwd,userId)>0?true:false;
    }

    @SneakyThrows
    @Override
    public PageInfo findAllUser(QueryUserVo vo) {

        PageHelper.startPage(vo.getPage(),vo.getLimit());
        LinkedList<User> list = userMapper.findAll(vo);

        LinkedList<User> filter = new LinkedList<>();

        for(User u:list){
            User user = new User();
            BeanUtils.copyProperties(user,u);
            //查询该用户的所有角色 切割成字符串赋值给roleName;
            List<Role> roleList = roleMapper.findByUid(Long.parseLong(String.valueOf(u.getId())));
            System.out.println("角色列表："+roleList);
            String roleName = "";
            String roleId = "";
            System.out.println(roleList.size());
            if(roleList.get(0)!=null){
                List<String> roleNameList = roleList.stream().map(role->{
                    return role==null?"":role.getRoleName();}).collect(Collectors.toList());
                List<Long> roleIdList = roleList.stream().map(role->{return role.getId();}).collect(Collectors.toList());
                if(roleNameList!=null){
                    roleName = roleNameList.toString();
                    roleName= roleName.substring(1,roleName.length()-1);
                }
                if(roleIdList!=null){
                    roleId = roleIdList.toString();
                    roleId= roleId.substring(1,roleId.length()-1);
                }
            }

            System.out.println(roleName);
            user.setRoleName(roleName);

            user.setRoleIds(roleId);
            //超管用户不显示
            if(user.getId()!=1){
                filter.add(user);
            }
        }
        PageInfo pageInfo = new PageInfo(filter);
        return pageInfo;
    }

    @Override
    public boolean delUser(Integer userId) {
        return userMapper.deleteByPrimaryKey(userId)>0?true:false;
    }

    @Override
    public void batchDelUser(Long[] userIds) {
         userMapper.batchDel(userIds);
    }

    @Override
    public void updateState(Long userId, Long state) {
        userMapper.updateState(userId,state);
    }

    @Override
    public void updateAll(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void updateBasics(User user) {
        System.out.println("要更新的用户"+user);
        userMapper.updateBasics(user);
    }
    @Override
    public List<User> findUser(QueryUserVo vo) {
        LinkedList<User> list = userMapper.findAll(vo);
        return list;
    }

    @Override
    public Integer countDepUser(Long depId) {
        return userMapper.countDepUser(depId);
    }

    @Override
    public Integer countPosUser(Long posId) {
        return userMapper.countPosUser(posId);
    }

    @Override
    public Integer countRoleUser(Long roleId) {
        return userMapper.countRoleUser(roleId);
    }


}
