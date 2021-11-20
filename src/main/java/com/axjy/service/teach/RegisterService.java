package com.axjy.service.teach;

import com.axjy.pojo.teach.Register;

import java.util.List;

public interface RegisterService {
    int query(Long id);
    List<Register> find(Long classModelId);
    int insert(Register register);
    int update(Register register);
    int delete(Long id);
}
