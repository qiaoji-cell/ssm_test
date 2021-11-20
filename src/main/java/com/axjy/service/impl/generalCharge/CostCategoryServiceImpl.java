package com.axjy.service.impl.generalCharge;

import com.axjy.mapper.generalCharge.CostCategoryMapper;
import com.axjy.pojo.generalCharge.CostCategory;
import com.axjy.service.generalCharge.CostCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/31 上午 08:59
 */
@Service("costCategoryService")
public class CostCategoryServiceImpl implements CostCategoryService {
    @Resource
    private CostCategoryMapper costCategoryMapper;
    @Override
    public List<CostCategory> findAll() {
        return costCategoryMapper.findAll();
    }
}
