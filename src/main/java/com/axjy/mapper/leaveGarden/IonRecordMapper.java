package com.axjy.mapper.leaveGarden;

import com.axjy.pojo.leaveGarden.IonRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IonRecordMapper {

    List<IonRecord> list(@Param("gardeId") Long gardeId,@Param("classroomId") Integer classroomId);

    int deleteByPrimaryKey(Long id);

    int insert(IonRecord record);

    int insertSelective(IonRecord record);

    IonRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(IonRecord record);

    int updateByPrimaryKey(IonRecord record);
}