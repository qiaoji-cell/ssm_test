package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.PermissionMapper;
import com.axjy.pojo.sys.Permission;
import com.axjy.service.sys.MenuService;
import com.axjy.utils.TreeUtil;
import com.axjy.vo.user.MenuVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Joe on 2021/10/11 下午 16:38
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {
    //获取所有权限
    @Resource
    private PermissionMapper permissionMapper;


    //找到指定用户的所有权限的菜单集合
    @Override
    public Map<String, Object> menu(Integer userId) {
        //包含三个集合的 外层map
        Map<String,Object> map = new HashMap<>(16);
        Map<String,Object> home = new HashMap<>(16);
        Map<String,Object> logo = new HashMap<>(16);
        List<Permission> menuList = permissionMapper.findAll(userId);
        List<MenuVo> menuInfo = new ArrayList<>();
        for(Permission p:menuList){
            MenuVo menuVo = new MenuVo();
            menuVo.setId(p.getId());
            menuVo.setPId(p.getParentId());
            menuVo.setHref(p.getUrl());
            menuVo.setTitle(p.getPermName());
            menuVo.setIcon(p.getIcon());
            //点击功能打开的方式 指定为打当前页打开tag窗口 不提供二次开发 数据库没有该字段 默认_self
            menuVo.setTarget("_self");
            menuInfo.add(menuVo);
        }
        map.put("menuInfo", TreeUtil.toTree(menuInfo,-1L    ));
        home.put("title","首页");
        home.put("href","sys/user/welcome");
        logo.put("title","欢迎使用");
        logo.put("image","statics/images/kindergartenLeaf.png");
        logo.put("href","sys/user/index");
        map.put("homeInfo",home);
        map.put("logoInfo",logo);
        return map;
    }

}
