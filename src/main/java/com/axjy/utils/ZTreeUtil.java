package com.axjy.utils;

import com.axjy.vo.sys.ZTreeVo;
import com.axjy.vo.user.MenuVo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021/10/21 下午 18:46
 */
public class ZTreeUtil {
    /**
     * 转成带child的菜单集合
     * @param treeList 集合
     * @param pid 找的一级菜单id
     * @return 所有菜单集合
     */
    public static List<ZTreeVo> toTree(List<ZTreeVo> treeList, Long pid){
        //准备新的集合装载转成带child的菜单集合后的list
        List<ZTreeVo> retList = new ArrayList<>();
        //循环传递进来的所有菜单集合
        for(ZTreeVo parent:treeList){
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
    private static ZTreeVo findChildren(ZTreeVo parent, List<ZTreeVo> treeList){
        for(ZTreeVo child:treeList){
            if(parent.getId().equals(child.getPId())){
                if(parent.getChildren() == null){
                    parent.setChildren(new ArrayList<>());
                }
                parent.getChildren().add(findChildren(child,treeList));
            }
        }
        return parent;
    }
}
