package com.axjy.service.child;

import com.axjy.pojo.child.StudentMatter;

public interface StudentMatterService {
    int insert(StudentMatter matter);
    StudentMatter search(String studentCode);
    int delete(String studentCode);
    int update(StudentMatter matter);
}
