package com.axjy.mapper.generalCharge;

import com.axjy.pojo.generalCharge.StuRecordEatCare;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StuRecordEatCareMapper {
    void updateOldToNow(Long[] stuIds);

    void updateByStuId(StuRecordEatCare record);

    Integer findByStuId(Long stuId);

    void batchInsert(@Param("record") StuRecordEatCare record);

    int deleteByPrimaryKey(Long id);

    int insert(StuRecordEatCare record);

    int insertSelective(StuRecordEatCare record);

    StuRecordEatCare selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(StuRecordEatCare record);

    int updateByPrimaryKey(StuRecordEatCare record);
}