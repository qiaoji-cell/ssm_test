package com.axjy.service.teach;

import com.axjy.pojo.teach.Classroom;
import com.axjy.vo.teach.ClassroomVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ClassroomService {
    List<Classroom> find(ClassroomVo classroomVo);

    PageInfo searchPage(Integer page, Integer limit, ClassroomVo classroomVo);
    int update(Classroom classroom);
    int insert(Classroom classroom);
    int delete(Long id);
}
