package com.axjy.service.sys;

import com.axjy.pojo.sys.User;
import com.axjy.vo.base.SettingQuery;
import com.axjy.vo.sys.QueryUserVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Joe on 2021/09/26 上午 9:22
 */
public interface UserService {
    //查询待审批的人员字符串
    String findApprovalPerson();

    /*查询用户*/
    int countUser(Long gardeId);

    void updateClassId(Integer classId,String userCode);

    void UpdateState(User user);

    PageInfo findSettingUser(SettingQuery vo);

    int addUser(User user);

    User findByUserCode(String userCode);

    Integer findByCode(String userCode,Long userId);

    //更新密码
    boolean updateUser(Integer userId,String userPwd);
    //查询用户列表
    PageInfo findAllUser(QueryUserVo vo);
    //查看用户列表
    List<User> findUser(QueryUserVo vo);
    //删除用户
    boolean delUser(Integer userId);

    void batchDelUser(Long[] userIds);
    void updateState(Long userId,Long state);

    void updateAll(User user);

    void updateBasics(User user);
    //查询有没有属于一个部门的员工
    Integer countDepUser(Long depId);
    //查询有没有属于一个职位的员工
    Integer countPosUser(Long posId);
    //查询有没有属于一个角色的员工
    Integer countRoleUser(Long roleId);
}
