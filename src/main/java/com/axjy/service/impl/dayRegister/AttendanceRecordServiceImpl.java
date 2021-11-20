package com.axjy.service.impl.dayRegister;

import com.axjy.mapper.dayRegister.AttendanceRecordMapper;
import com.axjy.pojo.dayRegister.AttendanceRecord;
import com.axjy.service.dayRegister.AttendanceRecordService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("attendancerecordservice")
public class AttendanceRecordServiceImpl implements AttendanceRecordService {

    @Resource
    private AttendanceRecordMapper attendanceRecordMapper;

    /**
     考勤统计
     * 分页
     * 条件查询
     * @param page
     * @param limit
     * @param attendanceRecord
     * @return
     */
    @Override
    public PageInfo findAll(Integer page, Integer limit , AttendanceRecord attendanceRecord) {
        PageHelper.startPage(page,limit);
        List<AttendanceRecord> list = attendanceRecordMapper.findAll(attendanceRecord);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    /**
     * 考勤统计在园人数
     * @return
     */
    @Override
    public int zyrs() {
        return attendanceRecordMapper.zyrs();
    }

    /**
     * 考勤统计不在园人数
     * @return
     */
    @Override
    public int bzyrs() {
        return attendanceRecordMapper.bzyrs();
    }

    /**
     * 考勤统计病假总次数
     * @return
     */
    @Override
    public int bingjia() {
        return attendanceRecordMapper.bingjia();
    }

    /**
     * 考勤统计事假总次数
     * @return
     */
    @Override
    public int shijia() {
        return attendanceRecordMapper.shijia();
    }

    /**
     * 考勤统计总人数
     * @return
     */
    @Override
    public int zongrenshu() {
        return attendanceRecordMapper.zongrenshu();
    }

    @Override
    public List<AttendanceRecord> querydatatime(String date) {
        String year=date.substring(0,4);
        String month=date.substring(5);
         List<AttendanceRecord> list = attendanceRecordMapper.querydatatime(year,month);
        return list;
    }


}
