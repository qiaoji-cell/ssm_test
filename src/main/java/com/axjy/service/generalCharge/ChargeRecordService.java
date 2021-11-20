package com.axjy.service.generalCharge;

import com.axjy.pojo.generalCharge.ChargeRecord;
import com.github.pagehelper.PageInfo;

import java.time.LocalDate;
import java.util.List;

/**
 * Created by Joe on 2021/11/05 下午 05:38
 */
public interface ChargeRecordService {
    //根据费项名称统计费项记录
    Integer countRecordByGrooveName(String grooveName);
    //根据园所 学生 查找所有的记录
    PageInfo findAll(ChargeRecord record);
    //修改状态
    void updateState(ChargeRecord chargeRecord);


    /*统计每月收入*/
    Double yiyue(Long gardeId);
    Double eryue(Long gardeId);
    Double sanyue(Long gardeId);
    Double siyue(Long gardeId);
    Double wuyue(Long gardeId);
    Double liuyue(Long gardeId);
    Double qiyue(Long gardeId);
    Double bayue(Long gardeId);
    Double jiuyue(Long gardeId);
    Double shiyue(Long gardeId);
    Double shiyiyue(Long gardeId);
    Double shieryue(Long gardeId);

    //定时生成月度收费记录
    List<ChargeRecord> generateRecord();

    //当月记录是否生成
    Integer countThisMonth(LocalDate currentMonth);

    //插入所有费用记录
    void insertAllFee(List<ChargeRecord> records);
    //根据id查找所有信息
    ChargeRecord selectById(Long id);

}
