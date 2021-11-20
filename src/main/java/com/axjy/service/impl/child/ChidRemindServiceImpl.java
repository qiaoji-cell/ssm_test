package com.axjy.service.impl.child;

import com.axjy.mapper.child.ChildRemindMapper;
import com.axjy.pojo.child.ChildRemind;
import com.axjy.service.child.ChildRemindService;
import com.axjy.vo.child.ChildVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("remindService")
public class ChidRemindServiceImpl implements ChildRemindService {
    @Resource
    private ChildRemindMapper remindMapper;
    @Override
    public PageInfo searchPage(Integer page, Integer limit,ChildVo childVo) {
        PageHelper.startPage(page,limit);
        List<ChildRemind> list = remindMapper.find(childVo);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
    @Override
    public List<ChildRemind> remindShow(Long gardenId) {
        return remindMapper.queryLimit(gardenId);
    }
    @Override
    public int insert(ChildRemind remind) {
        return remindMapper.insertSelective(remind);
    }

    @Override
    public void update(ChildRemind remind) {
        remindMapper.updateByPrimaryKeySelective(remind);
    }

    @Override
    public void delete(Long id) {
        remindMapper.deleteByPrimaryKey(id);
    }
}
