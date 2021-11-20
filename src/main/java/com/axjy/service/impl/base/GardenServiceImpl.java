package com.axjy.service.impl.base;

import com.axjy.mapper.base.GardenMapper;
import com.axjy.pojo.base.Garden;
import com.axjy.service.base.GardenService;
import com.axjy.vo.base.CodeNameVo;
import com.axjy.vo.base.GardenVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/15 下午 17:32
 */
@Service("gardenService")
public class GardenServiceImpl implements GardenService {
    @Resource
    private GardenMapper gardenMapper;

    public List<Garden> findAllGarden(){
        return gardenMapper.findAll(null,null);
    }
    @Override
    public PageInfo findAllGarden(GardenVo gardenVo) {
        PageHelper.startPage(gardenVo.getPage(),gardenVo.getLimit());
        List<Garden> list = gardenMapper.findAll(gardenVo.getField(),gardenVo.getValue());
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public boolean delGarden(Long[] ids) {
        return gardenMapper.batchDel(ids)>0?true:false;
    }

    @Override
    public boolean editGarden(Garden garden) {
        return gardenMapper.updateByPrimaryKeySelective(garden)>0?true:false;
    }

    @Override
    public boolean addGarden(Garden garden) {
        return gardenMapper.insertSelective(garden)>0?true:false;
    }

    @Override
    public Garden findByCode(CodeNameVo codeNameVo) {
        return gardenMapper.findByCode(codeNameVo);
    }

    @Override
    public Garden findByName(CodeNameVo codeNameVo) {
        return gardenMapper.findByName(codeNameVo);
    }
}
