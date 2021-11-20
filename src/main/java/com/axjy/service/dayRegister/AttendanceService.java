package com.axjy.service.dayRegister;

import com.axjy.pojo.dayRegister.Attendance;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

public interface AttendanceService {

    /**
     * 考勤全部信息
     * 分页
     * @return
     */
    PageInfo findAll(Integer page, Integer limit,String className);

    /*考勤状态已签*/
    void updateState(@Param("id")Long id);
    /*考勤状态未签*/
    void updateState2(@Param("id")Long id);
    /*考勤以锁定*/
    void updateyisuo(@Param("id")Long id);
    /*考勤未锁定*/
    void updateweisuo(@Param("id")Long id);
    /*考勤登记表请假修改*/
    void upqj(Attendance attendance);
    /*按钮请假修改考勤状态*/
    void ztqj(@Param("id") Long id);
    /*批量签到*/
    void plqj(@Param("ids") Integer[] ids);
    /*批量删除*/
    void del(@Param("ids") Integer[] ids);

    Integer uptj(Long id);
    Integer uptj2(Long id);
    Integer uptj3(Long id);
}
