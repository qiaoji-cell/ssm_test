package com.axjy.service.impl.generalCharge;

import com.axjy.mapper.generalCharge.GrooveMapper;
import com.axjy.pojo.generalCharge.Groove;
import com.axjy.service.generalCharge.GrooveService;
import com.axjy.vo.generalCharge.CostQueryVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/31 上午 09:44
 */
@Service("grooveService")
public class GrooveServiceImpl implements GrooveService {
    @Resource
    private GrooveMapper grooveMapper;

    @Override
    public Groove findById(Long id) {
        return grooveMapper.findById(id);
    }

    @Override
    public List<Groove> findAllWithDescByGardenId(Long gardenId, Long costCategory) {
        return grooveMapper.findAllWithDescByGardenId(gardenId,costCategory);
    }

    @Override
    public List<Groove> findOtherFee(Long gardenId) {
        return grooveMapper.findAllOtherFee(gardenId);
    }

    @Override
    public PageInfo findAllGardenId(CostQueryVo vo) {
        PageHelper.startPage(vo.getPage(),vo.getLimit());
        List<Groove> list = grooveMapper.findAllByGardenId(vo);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }


    @Override
    public Double huoshi(Long gardenId) {
        if (grooveMapper.huoshi(gardenId)!=null){
            return grooveMapper.huoshi(gardenId);
        }
        return 0.0;
    }

    @Override
    public Double jiaoCai(Long gardenId) {
        if (grooveMapper.jiaoCai(gardenId)!=null){
            return grooveMapper.jiaoCai(gardenId);
        }
        return 0.0;
    }

    @Override
    public Double weisheng(Long gardenId) {
        if (grooveMapper.weisheng(gardenId)!=null){
            return grooveMapper.weisheng(gardenId);
        }
        return 0.0;
    }

    @Override
    public Double yuanfu(Long gardenId) {
        if (grooveMapper.yuanfu(gardenId)!=null){
            return grooveMapper.yuanfu(gardenId);
        }
        return 0.0;
    }

    @Override
    public Double zhanwei(Long gardenId) {
        if (grooveMapper.zhanwei(gardenId)!=null){
            return grooveMapper.zhanwei(gardenId);
        }
        return 0.0;

    }

    @Override
    public void addGrooveCharge(Groove groove) {
        grooveMapper.insert(groove);
    }

    @Override
    public void delGrooveCharge(Long id) {
        grooveMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void upGrooveCharge(Groove groove) {
        grooveMapper.updateByPrimaryKey(groove);
    }

    @Override
    public void batchAdd(Long gardenId) {
        grooveMapper.batchAdd(gardenId);
    }
}
