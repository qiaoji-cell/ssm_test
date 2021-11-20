package com.axjy.service.teach;

import com.axjy.pojo.teach.AttendClass;

import java.util.List;

public interface AttendClassService {
    List<AttendClass> find(Long classModeId);
    int insert(AttendClass attendClass);
    int update(AttendClass attendClass);
    int delete(Long id);
}
