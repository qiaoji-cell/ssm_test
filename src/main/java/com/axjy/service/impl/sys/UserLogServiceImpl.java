package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.RoleMapper;
import com.axjy.mapper.sys.UserLogMapper;
import com.axjy.pojo.sys.Role;
import com.axjy.pojo.sys.UserLog;
import com.axjy.service.sys.RoleService;
import com.axjy.service.sys.UserLogService;
import com.axjy.vo.log.LogQueryVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Joe on 2021/10/26 下午 18:20
 */
@Service("userLogService")
public class UserLogServiceImpl implements UserLogService {

    @Resource
    private UserLogMapper userLogMapper;
    @Resource
    private RoleMapper roleMapper;

    @Override
    public PageInfo findAllLog(LogQueryVo vo) {
        System.out.println("日志查询条件："+vo);
        PageHelper.startPage(vo.getPage(),vo.getLimit());
        List<UserLog> list = userLogMapper.findAll(vo);
        for(UserLog log:list){
            //查询该用户的所有角色 切割成字符串赋值给roleName;
            List<Role> roleList = roleMapper.findByUid(Long.parseLong(String.valueOf(log.getId())));
            System.out.println("角色列表："+roleList);
            String roleName = "";
            System.out.println(roleList.size());
            if(roleList.get(0)!=null){
                List<String> roleNameList = roleList.stream().map(role->{
                    return role==null?"":role.getRoleName();}).collect(Collectors.toList());
                if(roleNameList!=null){
                    roleName = roleNameList.toString();
                    roleName= roleName.substring(1,roleName.length()-1);
                }
            }
            log.setRoleName(roleName);
        }
        PageInfo info = new PageInfo(list);
        return info;
    }

    @Override
    public Integer countTime(String userCode) {
        return userLogMapper.countTime(userCode);
    }

    @Override
    public void addLog(UserLog log) {
        userLogMapper.insert(log);
    }
}
