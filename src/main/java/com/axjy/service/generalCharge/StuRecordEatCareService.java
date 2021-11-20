package com.axjy.service.generalCharge;

import com.axjy.pojo.generalCharge.StuRecordEatCare;

/**
 * Created by Joe on 2021/11/02 下午 02:20
 */
public interface StuRecordEatCareService {
    //添加新变更的 伙食费、保育费记录 只添加这两个字段
    void addRecord(StuRecordEatCare record);

    //更新变更的 伙食费、保育费记录 保存到现伙食费
    void upRecord(StuRecordEatCare record);

    //通过学生id 查找费用记录
    Integer countByStuId(Long stuId);
}
