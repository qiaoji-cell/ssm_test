package com.axjy.service.impl.dayRegister;

import com.axjy.mapper.dayRegister.AttendanceMapper;
import com.axjy.pojo.dayRegister.Attendance;
import com.axjy.service.dayRegister.AttendanceService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("AttendanceService")
public class AttendanceServiceImpl implements AttendanceService {

    @Resource
    private AttendanceMapper attendanceMapper;


    /**
     * 分页
     * @param page
     * @param limit
     * @return
     */
    @Override
    public PageInfo findAll(Integer page, Integer limit,String className) {
        PageHelper.startPage(page,limit);
        List<Attendance> list = attendanceMapper.findAll(className);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    /**
     * 考勤状态已签
     * @param id
     */
    @Override
    public void updateState(Long id) {
        attendanceMapper.updateState(id);
    }

    /**
     * 考勤状态未签
     * @param id
     */
    @Override
    public void updateState2(Long id) {
        attendanceMapper.updateState2(id);
    }

    /**
     * 考勤已锁定
     * @param id
     */
    @Override
    public void updateyisuo(Long id) {
        attendanceMapper.updateyisuo(id);
    }

    /**
     * 考勤未锁定
     * @param id
     */
    @Override
    public void updateweisuo(Long id) {
        attendanceMapper.updateweisuo(id);
    }

    /**
     * 修改请假那一些
     * @param attendance
     */
    @Override
    public void upqj(Attendance attendance) {
        attendanceMapper.upqj(attendance);
    }

    /**
     * 按钮请假修改考勤状态
     * @param id
     */
    @Override
    public void ztqj(Long id) {
        attendanceMapper.ztqj(id);
    }

    /**
     * 批量签到
     * @param ids
     */
    @Override
    public void plqj(Integer[] ids) {
        attendanceMapper.plqj(ids);
    }

    /**
     * 批量删除
     * @param ids
     */
    @Override
    public void del(Integer[] ids) {
        attendanceMapper.del(ids);
    }

    @Override
    public Integer uptj(Long id) {
        return attendanceMapper.uptj(id);
    }

    @Override
    public Integer uptj2(Long id) {
        return attendanceMapper.uptj2(id);
    }

    @Override
    public Integer uptj3(Long id) {
        return attendanceMapper.uptj3(id);
    }


}
