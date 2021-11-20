package com.axjy.service.dayRegister;

import com.axjy.pojo.dayRegister.AttendanceRecord;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AttendanceRecordService {


   /**
    * 考勤统计显示数据
    *     * 分页
    *     * 条件查询
    * @param page
    * @param limit
    * @param attendanceRecord
    * @return
    */
   PageInfo findAll(Integer page, Integer limit, AttendanceRecord attendanceRecord);

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




   List<AttendanceRecord> querydatatime(String date);


}
