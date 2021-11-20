package com.axjy.service.impl.child;

import com.axjy.mapper.child.StudentMatterMapper;
import com.axjy.pojo.child.StudentMatter;
import com.axjy.service.child.StudentMatterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("matterService")
public class StudentMatterServiceImpl implements StudentMatterService {
    @Resource
    private StudentMatterMapper matterMapper;
    @Override
    public int insert(StudentMatter matter) {
        return matterMapper.insert(matter);
    }

    @Override
    public StudentMatter search(String studentCode) {
        return matterMapper.find(studentCode);
    }

    @Override
    public int delete(String studentCode) {
        return matterMapper.delete(studentCode);
    }

    @Override
    public int update(StudentMatter matter) {
        return  matterMapper.updateByPrimaryKeySelective(matter);
    }
}
