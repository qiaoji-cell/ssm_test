package com.axjy.service.impl.sys;

import com.axjy.mapper.base.DepMapper;
import com.axjy.pojo.sys.Dep;
import com.axjy.service.sys.DepService;
import com.axjy.utils.DepTreeUtil;
import com.axjy.vo.base.DepTreeVo;
import lombok.SneakyThrows;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021/10/18 上午 9:23
 */
@Service("depService")
public class DepServiceImpl implements DepService {
    @Resource
    private DepMapper depMapper;


    @Override
    @SneakyThrows
    public List<DepTreeVo> findAllDep(Long gardenId) {
        List<Dep> deps = depMapper.findAll(gardenId);
        List<DepTreeVo> treeVos = new ArrayList<>();
        for (int i = 0; i <deps.size(); i++) {

            DepTreeVo treeVo = new DepTreeVo();
            //复制属性
            BeanUtils.copyProperties(treeVo,deps.get(i));
            //特殊属性
            treeVo.setPid(deps.get(i).getParentId());
            treeVo.setTitle(deps.get(i).getDepName());
            if(i==0){
                treeVo.setSpread(true);
            }
            treeVos.add(treeVo);

        }

        return DepTreeUtil.toTree(treeVos,-1L);
    }

    @Override
    public boolean updateDep(Dep dep) {
        return depMapper.updateByPrimaryKeySelective(dep)>0?true:false;
    }

    @Override
    public void addDep(Dep dep, Long gardenId) {
        dep.setId(null);
        depMapper.insertSelective(dep,gardenId);
    }

    @Override
    public void delDep(Long id) {
        depMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Object findByCode(String code,Long depId,Long gardenId) {
        return depMapper.findByCode(code,depId,gardenId);
    }

    @Override
    public Object findByName(String name,Long depId,Long gardenId) {
        return depMapper.findByName(name,depId,gardenId);
    }

    @Override
    public Integer findByParentId(Long depId) {
        return depMapper.findByParentId(depId);
    }
}
