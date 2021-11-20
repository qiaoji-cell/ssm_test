package com.axjy.mapper.generalCharge;

import com.axjy.pojo.generalCharge.ChargeRecord;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;

public interface ChargeRecordMapper {
    //修改状态
    void updateState(@Param("record")ChargeRecord record);

    //根据费项名称统计
    Integer countByGrooveName(String grooveName);
    //统计本月是否生成过记录
    Integer countThisMonth(LocalDate currentDate);

    /*统计每个月份的收入*/
    Double yiyue(Long gardenId);
    Double eryue(Long gardenId);
    Double sanyue(Long gardenId);
    Double siyue(Long gardenId);
    Double wuyue(Long gardenId);
    Double liuyue(Long gardenId);
    Double qiyue(Long gardenId);
    Double bayue(Long gardenId);
    Double jiuyue(Long gardenId);
    Double shiyue(Long gardenId);
    Double shiyiyue(Long gardenId);
    Double shieryue(Long gardenId);

    //定时每月生成一次费用记录

    //查询生成当月所有园所所有学生的每项费用记录列表
    List<ChargeRecord> generateRecord(@Param("stuId")Long stuId,@Param("gardenId")Long gardenId);
    //插入所有记录到费用记录表
    void insertAll(List<ChargeRecord> records);

    List<ChargeRecord> findAll(@Param("vo") ChargeRecord chargeRecord);

    int deleteByPrimaryKey(Long id);

    int insert(ChargeRecord record);

    int insertSelective(ChargeRecord record);

    ChargeRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ChargeRecord record);

    int updateByPrimaryKey(ChargeRecord record);
}