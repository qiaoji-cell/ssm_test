package com.axjy.mapper.dayRegister;

import com.axjy.pojo.dayRegister.OurseAttendanceRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseCountMapper {

    /**
     * 课程统计
     * 分页
     * 条件查询
     * @param ourseAttendanceRecord
     * @return
     */
    List<OurseAttendanceRecord> findAll(@Param("ourseAttendanceRecord") OurseAttendanceRecord ourseAttendanceRecord);

    /**
     * 统计课程总和
     * @return
     */
    Integer keshiozongji();


}
