package com.axjy.utils;

import com.axjy.vo.base.DepTreeVo;

import javax.swing.event.CaretListener;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021/10/18 上午 9:34
 */
public class DepTreeUtil {
    public static List<DepTreeVo> toTree(List<DepTreeVo> treeVoList,Long pid){
        List<DepTreeVo> retList = new ArrayList<>();
        for(DepTreeVo parent:treeVoList){
            if(pid == parent.getPid()){
                retList.add(findChildren(parent,treeVoList));
            }
        }
        return retList;
    }

    public static DepTreeVo findChildren(DepTreeVo parent,List<DepTreeVo> treeVoList){
        for(DepTreeVo child:treeVoList){
            if(parent.getId().equals(child.getPid())){
                if(parent.getChildren() == null){
                    parent.setChildren(new ArrayList<>());
                }
                parent.getChildren().add(findChildren(child,treeVoList));
            }
        }
        return parent;
    }
}
