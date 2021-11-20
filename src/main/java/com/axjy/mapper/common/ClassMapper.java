package com.axjy.mapper.common;

import com.axjy.pojo.base.Class;
import com.axjy.pojo.recruit.Student;
import com.axjy.vo.generalCharge.AboutVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*班级表  */
public interface ClassMapper {
    /*查询每个园所的第一个班级班级*/
    Class find(Long gardenId);
    List<Long> findStuIdsByClassId(@Param("gardenId")Long gardenId, @Param("classId")Long classId);
    //查询每个班的学生
    List<AboutVo> findEachClassChildTree(Long gardenId, Long classId);

    void batchDelClassByGardenId(Long[] ids);
    void batchAdd(Long gardenId);

    List<Class> findGardenClass();

    List<Class> findAll(Long gardenId);

    int deleteByPrimaryKey(Long id);

    int insert(Class record);

    int insertSelective(Class record);

    Class selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Class record);

    int updateByPrimaryKey(Class record);
}