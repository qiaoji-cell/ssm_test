package com.axjy.mapper.generalCharge;

import com.axjy.pojo.generalCharge.Groove;
import com.axjy.pojo.generalCharge.StuRecordEatCare;
import com.axjy.vo.generalCharge.CostQueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GrooveMapper {
    //根据id查找费项
    Groove findById(Long id);
    //批量添加费项
    void batchAdd(Long gardenId);
    //查询指定园所 所有不包含伙食费 保育费的费项
    List<Groove> findAllOtherFee(Long gardenId);
    //查询带说明的指定园所不同类型的费用列表
    List<Groove> findAllWithDescByGardenId(@Param("gardenId")Long gardenId
                                          ,@Param("costCategory")Long costCategory);

    List<Groove> findAllByGardenId(@Param("vo") CostQueryVo vo);

    int deleteByPrimaryKey(Long id);

    /*统计五个费用*/
    Double huoshi(Long gardenId);
    Double jiaoCai(Long gardenId);
    Double weisheng(Long gardenId);
    Double yuanfu(Long gardenId);
    Double zhanwei(Long gardenId);


    int insert(Groove record);

    int insertSelective(Groove record);

    Groove selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Groove record);

    int updateByPrimaryKey(Groove record);
}