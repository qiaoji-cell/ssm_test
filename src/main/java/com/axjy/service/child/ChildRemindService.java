package com.axjy.service.child;

import com.axjy.pojo.child.ChildRemind;
import com.axjy.vo.child.ChildVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ChildRemindService {
    PageInfo searchPage(Integer page, Integer limit,ChildVo vo);
    List<ChildRemind> remindShow(Long gardenId);

    int insert(ChildRemind remind);
    void update(ChildRemind remind);
    void delete(Long id);
}
