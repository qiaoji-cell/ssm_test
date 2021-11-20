package com.axjy.service.impl.teach;

import com.axjy.mapper.teach.SubjectMapper;
import com.axjy.pojo.teach.Subject;
import com.axjy.service.teach.SubjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {
    @Resource
    private SubjectMapper subjectMapper;

    @Override
    public List<Subject> find(Long gardenId) {
        System.out.println( subjectMapper.find(gardenId)+"------------");
        return subjectMapper.find(gardenId);
    }

    @Override
    public int insert(Subject subject) {
        System.out.println(subject+"这是实现类里的");
        return subjectMapper.insertSelective(subject);
    }
}
