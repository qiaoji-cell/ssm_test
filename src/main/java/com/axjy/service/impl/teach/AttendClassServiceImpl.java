package com.axjy.service.impl.teach;

import com.axjy.mapper.teach.AttendClassMapper;
import com.axjy.pojo.teach.AttendClass;
import com.axjy.service.teach.AttendClassService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("attendClassService")
public class AttendClassServiceImpl implements AttendClassService {
    @Resource
    private AttendClassMapper attendClassMapper;

    @Override
    public List<AttendClass> find(Long classModeId) {
        return attendClassMapper.find(classModeId);
    }

    @Override
    public int insert(AttendClass attendClass) {
        return attendClassMapper.insertSelective(attendClass);
    }

    @Override
    public int update(AttendClass attendClass) {
        return attendClassMapper.updateByPrimaryKeySelective(attendClass);
    }

    @Override
    public int delete(Long id) {
        return attendClassMapper.deleteByPrimaryKey(id);
    }
}
