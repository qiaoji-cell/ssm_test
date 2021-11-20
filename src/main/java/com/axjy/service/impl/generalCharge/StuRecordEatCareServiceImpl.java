package com.axjy.service.impl.generalCharge;

import com.axjy.mapper.generalCharge.StuRecordEatCareMapper;
import com.axjy.pojo.generalCharge.StuRecordEatCare;
import com.axjy.service.generalCharge.StuRecordEatCareService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Joe on 2021/11/02 下午 02:23
 */
@Service("stuRecordEatCareService")
public class StuRecordEatCareServiceImpl implements StuRecordEatCareService {
    @Resource
    private StuRecordEatCareMapper stuRecordEatCareMapper;
    @Override
    public void addRecord(StuRecordEatCare record) {
        stuRecordEatCareMapper.insertSelective(record);
    }

    @Override
    public void upRecord(StuRecordEatCare record) {
        System.out.println("要秀爱"+record);
        stuRecordEatCareMapper.updateByStuId(record);
    }

    @Override
    public Integer countByStuId(Long stuId) {
        return stuRecordEatCareMapper.findByStuId(stuId);
    }


}
