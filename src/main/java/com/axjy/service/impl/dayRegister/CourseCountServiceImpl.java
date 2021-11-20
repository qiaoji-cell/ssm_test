package com.axjy.service.impl.dayRegister;

import com.axjy.mapper.dayRegister.CourseCountMapper;
import com.axjy.pojo.dayRegister.OurseAttendanceRecord;
import com.axjy.service.dayRegister.CourseCountService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("coursecountservice")
public class CourseCountServiceImpl implements CourseCountService {

    @Resource
    private CourseCountMapper courseCountMapper;


    @Override
    public PageInfo findAll(Integer page, Integer limit, OurseAttendanceRecord ourseAttendanceRecord) {
        PageHelper.startPage(page,limit);
        List<OurseAttendanceRecord> list = courseCountMapper.findAll(ourseAttendanceRecord);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public Integer keshiozongji() {
      return   courseCountMapper.keshiozongji();
    }
}
