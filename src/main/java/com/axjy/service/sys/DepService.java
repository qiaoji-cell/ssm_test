package com.axjy.service.sys;

import com.axjy.pojo.sys.Dep;
import com.axjy.vo.base.DepTreeVo;

import java.util.List;

/**
 * Created by Joe on 2021/10/18 上午 9:22
 */
public interface DepService {
    List<DepTreeVo> findAllDep(Long gardenId);

    boolean updateDep(Dep dep);

    void addDep(Dep dep, Long gardenId);

    void delDep(Long id);

    Object findByCode(String code,Long depId,Long gardenId);

    Object findByName(String name,Long depId,Long gardenId);

    Integer findByParentId(Long depId);
}
