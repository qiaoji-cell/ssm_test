package com.axjy.utils;
import com.axjy.vo.user.MenuVo;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021/10/13 上午 6:34
 * 转换多级菜单list集合工具类
 */
public class TreeUtil {

    /**
     * 转成带child的菜单集合
     * @param treeList 集合
     * @param pid 找的一级菜单id
     * @return 所有菜单集合
     */
    public static List<MenuVo> toTree(List<MenuVo> treeList, Long pid){
        //准备新的集合装载转成带child的菜单集合后的list
        List<MenuVo> retList = new ArrayList<>();
        //循环传递进来的所有菜单集合
        for(MenuVo parent:treeList){
            //如果级别id等于指定的级别pid
            if(pid == parent.getPId()){
                //执行找寻它有没有子菜单的方法并追加进 容器集合
                retList.add(findChildren(parent,treeList));
            }
        }
        return retList;
    }

    /**
     * 查找集合里 功能菜单是否包含子菜单
     * @param parent 要查找的菜单项
     * @param treeList 包含子级的菜单集合
     * @return 指定菜单及子菜单
     */
    private static MenuVo findChildren(MenuVo parent,List<MenuVo> treeList){
        for(MenuVo child:treeList){
            if(parent.getId().equals(child.getPId())){
                if(parent.getChild() == null){
                    parent.setChild(new ArrayList<>());
                }
                parent.getChild().add(findChildren(child,treeList));
            }
        }
        return parent;
    }
}
