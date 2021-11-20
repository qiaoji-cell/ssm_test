package com.axjy.service.impl.child;

import com.axjy.mapper.child.ParentsMapper;
import com.axjy.pojo.child.Parents;
import com.axjy.service.child.ParentsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("parentsService")
public class ParentsServiceImpl implements ParentsService {



    @Resource
    private ParentsMapper parentsMapper;

    @Override
    public Parents find(String studentCode) {
        return parentsMapper.find(studentCode);
    }

    @Override
    public int insert(Parents parents) {
       return parentsMapper.insert(parents);
    }

    @Override
    public int delete(String studentCode) {
        return parentsMapper.delete(studentCode);
    }

    @Override
    public int update(Parents parents) {
        return parentsMapper.updateByPrimaryKeySelective(parents);
    }


}
