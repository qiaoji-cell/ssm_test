package com.axjy.service.dayRegister;

import com.axjy.pojo.dayRegister.OurseAttendanceRecord;
import com.github.pagehelper.PageInfo;

public interface CourseCountService {

    PageInfo findAll(Integer page,Integer limit,OurseAttendanceRecord ourseAttendanceRecord);

    Integer keshiozongji();
}
