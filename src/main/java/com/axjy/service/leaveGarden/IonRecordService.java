package com.axjy.service.leaveGarden;

import com.axjy.pojo.leaveGarden.IonRecord;

import java.util.List;

public interface IonRecordService {
    List<IonRecord> list(Long gardenId, Integer classroomId);
    int insert(IonRecord record);
    int update(IonRecord record);
}
