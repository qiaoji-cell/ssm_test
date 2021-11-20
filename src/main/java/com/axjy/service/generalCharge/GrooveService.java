package com.axjy.service.generalCharge;

import com.axjy.pojo.generalCharge.Groove;
import com.axjy.vo.generalCharge.CostQueryVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Joe on 2021/10/31 上午 09:41
 */
public interface GrooveService {


    /*统计五个费用*/
    Double huoshi(Long gardenId);
    Double jiaoCai(Long gardenId);
    Double weisheng(Long gardenId);
    Double yuanfu(Long gardenId);
    Double zhanwei(Long gardenId);

    //根据id查找费项
    Groove findById(Long id);
    //查找指定园所指定类型带说明的费用列表
    List<Groove> findAllWithDescByGardenId(Long gardenId,Long costCategory);
    //查找指定园所的所有其他费项
    List<Groove> findOtherFee(Long gardenId);
    //查找指定园所的常规收费
    PageInfo findAllGardenId(CostQueryVo vo);
    //新增指定园所的常规收费
    void addGrooveCharge(Groove groove);
    //删除指定园所的常规收费
    void delGrooveCharge(Long id);
    //修改指定园所的常规收费
    void upGrooveCharge(Groove groove);
    //批量添加费项
    void batchAdd(Long gardenId);

}
