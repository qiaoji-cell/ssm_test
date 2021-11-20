package com.axjy.mapper.sys;

import com.axjy.mapper.common.MyBatisBaseDao;
import com.axjy.pojo.sys.User;
import com.axjy.vo.base.SettingQuery;
import com.axjy.vo.sys.QueryUserVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.LinkedList;
import java.util.List;

/**
 * KmsUserMapper继承基类
 */
@Repository
public interface UserMapper extends MyBatisBaseDao<User, Integer> {

    /*统计用户*/
    int countUser(Long gardeId);

    List<User> findApprovalPerson();

    void updateClassId(@Param("classId")Integer classId,@Param("userCode")String userCode);

    void batchDel(Long[] userIds);

    User selectByUserCode(String userCode);

    //修改密码
    Integer updatePwd(@Param("userPwd") String userPwd, @Param("userId") Integer userId);

    LinkedList<User> findAll(@Param("vo")QueryUserVo vo);

    List<User> findSettingUser(@Param("vo")SettingQuery vo);

    Integer findByCode(@Param("userCode")String userCode,@Param("userId") Long userId);

    void updateState(@Param("userId")Long userId,@Param("state")Long state);

    void updateBasics(@Param("user")User user);

    Integer countDepUser(Long depId);

    Integer countPosUser(Long posId);

    Integer countRoleUser(Long roleId);
}