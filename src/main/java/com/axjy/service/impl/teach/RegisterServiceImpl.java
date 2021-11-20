package com.axjy.service.impl.teach;

import com.axjy.mapper.teach.RegisterMapper;
import com.axjy.pojo.teach.Register;
import com.axjy.service.teach.RegisterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("registerService")
public class RegisterServiceImpl implements RegisterService {


    @Resource
    private RegisterMapper registerMapper;

    @Override
    public int query(Long id) {
        return registerMapper.query(id);
    }

    @Override
    public List<Register> find(Long classModelId) {
        return registerMapper.find(classModelId);
    }

    @Override
    public int insert(Register register) {
        return registerMapper.insertSelective(register);
    }

    @Override
    public int update(Register register) {
        System.out.println(register+"实现类里的改-------------");
        return registerMapper.updateByPrimaryKeySelective(register);
    }

    @Override
    public int delete(Long id) {
        return registerMapper.deleteByPrimaryKey(id);
    }

}
