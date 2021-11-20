package com.axjy.service.dayRegister;

import com.axjy.pojo.teach.Classmodel;
import com.axjy.pojo.dayRegister.OurseAttendanceRecord;
import com.axjy.vo.dayRegisterVo.DayVo;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OurseAttendanceRecordService {

    /**
     * 课程考勤显示数据
     * 分页
     * 条件查询
     * @param page
     * @param limit
     * @param ourseAttendanceRecord
     * @return
     */
    PageInfo findAll(Integer page, Integer limit, OurseAttendanceRecord ourseAttendanceRecord);

    /**
     * 班型
     * @return
     */
    List<Classmodel> findAl();

    /**
     * 批量删除
     * @param ids
     */
    void pldelete(@Param("ids") Integer[] ids);

    /*课程考勤登记修改*/
    void djup(@Param("dayVo") DayVo dayVo);


}
