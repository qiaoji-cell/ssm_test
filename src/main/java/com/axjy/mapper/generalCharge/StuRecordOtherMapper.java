package com.axjy.mapper.generalCharge;

import com.axjy.pojo.generalCharge.Groove;
import com.axjy.pojo.generalCharge.StuRecordOther;
import com.axjy.vo.other.OtherFeeVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StuRecordOtherMapper {
    List<Groove> findAllNoByStuId(@Param("gardenId")Long gardenId, @Param("stuId")Long stuId);

    int insertRecord(@Param("stuId")Long stuId
            , @Param("costIds") Long[] costIds
            , @Param("se") OtherFeeVo se);

    //通过学生id 查询 包含的 costId
    List<Long> findCostIdsByStuId(Long stuId);

    List<StuRecordOther> findAllByStuId(Long stuId);

    //通过费项 ids数组 删除相关记录
    int batchDel(@Param("stuId")Long stuId,@Param("costIds")Long[] costIds);

    int deleteByPrimaryKey(Long id);

    int insert(StuRecordOther record);

    int insertSelective(StuRecordOther record);

    StuRecordOther selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(StuRecordOther record);

    int updateByPrimaryKey(StuRecordOther record);
}