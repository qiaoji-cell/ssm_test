package com.axjy.service.teach;

import com.axjy.pojo.teach.Subject;

import java.util.List;

public interface SubjectService {
    List<Subject> find(Long gardenId);
    int insert(Subject subject);
}
