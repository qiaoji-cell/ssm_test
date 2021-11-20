package com.axjy.service.impl.sys;

import com.axjy.mapper.sys.PosMapper;
import com.axjy.pojo.sys.Pos;
import com.axjy.service.sys.PosService;
import com.axjy.vo.sys.QuickQueryVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/19 上午 8:58
 */
@Service("posService")
public class PosServiceImpl implements PosService {
    @Resource
    private PosMapper posMapper;
    @Override
    public PageInfo findAllPos(QuickQueryVo quickQueryVo) {
        System.out.println("条件:"+quickQueryVo);
        PageHelper.startPage(quickQueryVo.getPage(), quickQueryVo.getLimit());
        List<Pos> posList = posMapper.findAll(quickQueryVo.getField(), quickQueryVo.getValue(), quickQueryVo.getGardenId());
        PageInfo pageInfo = new PageInfo(posList);
        return pageInfo;
    }

    @Override
    public List<Pos> findAllList(Long gardenId) {
        return posMapper.findAll(null,null,gardenId);
    }

    @Override
    public void addPos(Pos pos) {
        posMapper.insert(pos);
    }

    @Override
    public void delPos(Long[] posId) {
        posMapper.batchDel(posId);
    }

    @Override
    public void updatePos(Pos pos) {
        posMapper.updateByPrimaryKeySelective(pos);
    }

    @Override
    public Pos findByName(String name, Long gardenId, Long posId) {
        return posMapper.findByName(name,gardenId,posId);
    }
}
