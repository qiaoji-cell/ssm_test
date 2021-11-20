package com.axjy.service.generalCharge;

import com.axjy.pojo.generalCharge.Groove;
import com.axjy.pojo.generalCharge.StuRecordOther;
import com.axjy.vo.other.OtherFeeVo;

import java.util.List;

/**
 * Created by Joe on 2021/11/03 下午 10:57
 */
public interface StuRecordOtherService {
    //添加单个费项信息
    void addSingleRecord(Long gardenId,Long stuId,Long[] costIds,OtherFeeVo se);

    //添加相关的费项信息
    void addRecord(Long gardenId,Long classId,Long[] costIds, OtherFeeVo se);

    //更新相关的费项信息
    void upRecord(Long gardenId, Long classId, Long[] costIds, OtherFeeVo vo);

    //查询学生id
    List<Long> findCostIdsByStuId(Long stuId);

    //查询指定学生的费项记录
    List<StuRecordOther> findAllByStuId(Long stuId);

    //查询指定学生不包含的费项记录
    List<Groove> findAllNoByStuId(Long gardenId,Long stuId);

    //批量删除指定的费项
    void batchDel(Long stuId,Long[] ids);
}
