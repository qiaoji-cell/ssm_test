package com.axjy.mapper.dayRegister;

import com.axjy.pojo.dayRegister.Attendance;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttendanceMapper {

    /**
     * 查看全部数据
     * @return
     */
    List<Attendance> findAll(String className);

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

    /**
     * 批量啥才能
     * @param ids
     */
    void del(@Param("ids") Integer[] ids);








    Integer uptj(Long id);
    Integer uptj2(Long id);
    Integer uptj3(Long id);








    int deleteByPrimaryKey(Long id);

    int insert(Attendance record);

    int insertSelective(Attendance record);

    Attendance selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Attendance record);

    int updateByPrimaryKey(Attendance record);
}