package com.axjy.mapper.dayRegister;

import com.axjy.pojo.teach.Classmodel;
import com.axjy.pojo.dayRegister.OurseAttendanceRecord;
import com.axjy.vo.dayRegisterVo.DayVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OurseAttendanceRecordMapper {

    /**
     * 课程考勤显示数据
     * 分页
     * 条件查询
     * @param ourseAttendanceRecord
     * @return
     */
    List<OurseAttendanceRecord> findAll(@Param("ourseAttendanceRecord") OurseAttendanceRecord ourseAttendanceRecord);

    /**
     * 班型
     * @return
     */
    List<Classmodel> findAl();

    /**
     * 批量删除
     * @param ids
     */
    void pl(@Param("ids") Integer[] ids);

    /*课程考勤登记修改*/
    void djup(@Param("dayVo") DayVo dayVo);






















    int deleteByPrimaryKey(Long id);

    int insert(OurseAttendanceRecord record);

    int insertSelective(OurseAttendanceRecord record);

    OurseAttendanceRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OurseAttendanceRecord record);

    int updateByPrimaryKey(OurseAttendanceRecord record);
}