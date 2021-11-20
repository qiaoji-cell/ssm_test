package com.axjy.service.impl;

import com.axjy.mapper.AttendanceStateMapper;
import com.axjy.pojo.AttendanceState;
import com.axjy.service.AttendanceStateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("stateService")
public class AttendanceStateServiceImpl implements AttendanceStateService {
    @Resource
    private AttendanceStateMapper stateMapper;

    @Override
    public List<AttendanceState> find() {
        return stateMapper.find();
    }
}
