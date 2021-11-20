package com.axjy.service.impl.leaveGarden;

import com.axjy.mapper.leaveGarden.IonRecordMapper;
import com.axjy.pojo.leaveGarden.IonRecord;
import com.axjy.service.leaveGarden.IonRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("ionRecordService")
public class IonRecordServiceImpl implements IonRecordService {
    @Resource
    private IonRecordMapper ionRecordMapper;

    @Override
    public List<IonRecord> list(Long gardenId, Integer classroomId) {
        return ionRecordMapper.list(gardenId,classroomId);
    }

    @Override
    public int insert(IonRecord record) {
        return ionRecordMapper.insertSelective(record);
    }

    @Override
    public int update(IonRecord record) {
        return ionRecordMapper.updateByPrimaryKeySelective(record);
    }
}
