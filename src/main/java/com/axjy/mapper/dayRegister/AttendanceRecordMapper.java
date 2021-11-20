package com.axjy.mapper.dayRegister;

import com.axjy.pojo.dayRegister.AttendanceRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttendanceRecordMapper {

    /**
     考勤统计显示全部信息
     * 分页
     * 条件查询
     * @param attendanceRecord
     * @return
     */
    List<AttendanceRecord> findAll(@Param("attendanceRecord") AttendanceRecord attendanceRecord);




    /**
     * 考勤统计在园人数
     * @return
     */
    int zyrs();

    /**
     * 考勤统计不在园人数
     * @return
     */
    int bzyrs();

    /**
     * 考勤统计病假总数
     * @return
     */
    int bingjia();

    /**
     * 考勤统计事假总次数
     * @return
     */
    int shijia();

    /**
     * 考勤统计总人数
     * @return
     */
    int zongrenshu();

    /**
     * 考勤统计查看
     * @param year
     * @param month
     * @return
     */
    List<AttendanceRecord> querydatatime(@Param("year") String year,@Param("month") String month);







    int deleteByPrimaryKey(Long id);

    int insert(AttendanceRecord record);

    int insertSelective(AttendanceRecord record);

    AttendanceRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AttendanceRecord record);

    int updateByPrimaryKey(AttendanceRecord record);
}