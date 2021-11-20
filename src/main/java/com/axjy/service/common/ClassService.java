package com.axjy.service.common;

import com.axjy.pojo.base.Class;
import com.axjy.vo.generalCharge.AboutVo;

import java.util.List;

public interface ClassService {
    /*查询每个园所的默认班级*/
    Class findClass(Long gardenId);

    List<Long> findStuIdsByClassId(Long gardenId,Long classId);

    List<Class> find(Long gardenId);

    List<AboutVo> findWithChild(Long gardenId);

    List<Class> findGardenClass();

    //查询指定园所的班级
    void batchAdd(Long gardenId);

    void batchDelClassByGardenId(Long[] ids);
}
