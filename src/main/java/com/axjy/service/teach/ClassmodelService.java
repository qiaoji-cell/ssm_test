package com.axjy.service.teach;

import com.axjy.pojo.teach.Classmodel;
import com.axjy.vo.teach.ClassmodelVo;
import com.github.pagehelper.PageInfo;

public interface ClassmodelService {
    PageInfo searchPage(Integer page, Integer limit, ClassmodelVo classmodelVo);
    int insert(Classmodel classmodel);
    int update(Classmodel classmodel);
}
