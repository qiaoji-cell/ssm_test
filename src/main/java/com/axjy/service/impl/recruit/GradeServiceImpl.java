package com.axjy.service.impl.recruit;

import com.axjy.mapper.reruit.GradeMapper;
import com.axjy.pojo.recruit.Grade;
import com.axjy.service.recruit.GradeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/14 下午 17:55
 */
@Service("gradeService")
public class GradeServiceImpl implements GradeService {
    @Resource
    private GradeMapper gradeMapper;

    @Override
    public List<Grade> findAllGrade(Long gardenId) {
        return gradeMapper.findAll(gardenId);
    }

    @Override
    public void batchAddGrade(Long gardenId) {
        gradeMapper.batchAddGrade(gardenId);
    }

    @Override
    public void batchDelGradeByGardenId(Long[] ids) {
        gradeMapper.batchDelGradeByGardenId(ids);
    }


}
