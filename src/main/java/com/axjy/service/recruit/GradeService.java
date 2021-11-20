package com.axjy.service.recruit;

import com.axjy.pojo.recruit.Grade;

import java.util.List;

/**
 * Created by Joe on 2021/10/14 下午 17:54
 */
public interface GradeService {
    List<Grade> findAllGrade(Long gardenId);

    //批量添加指定园所的所有固定班级
    void batchAddGrade(Long gardenId);

    //批量删除园所年级
    void batchDelGradeByGardenId(Long[] ids);
}
