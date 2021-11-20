package com.axjy.service.impl.teach;

import com.axjy.mapper.teach.ClassmodelMapper;
import com.axjy.pojo.teach.Classmodel;
import com.axjy.service.teach.ClassmodelService;
import com.axjy.vo.teach.ClassmodelVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("classmodelService")
public class ClassmodelServiceImpl implements ClassmodelService {
    @Resource
    private ClassmodelMapper classmodelMapper;
    /*查询*/
    @Override
    public PageInfo searchPage(Integer page, Integer limit, ClassmodelVo classmodelVo) {
        PageHelper.startPage(page,limit);
        System.out.println("到这里啦!");
        List<Classmodel> list= classmodelMapper.find(classmodelVo);
        System.out.println(list+"--------------------班型表的数据----------------------");
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
        /*
        * PageHelper.startPage(page,limit);
        System.out.println("到这里啦!");
        List<Classroom> list= classroomMapper.find(classroomVo);
        System.out.println(list+"--------------------");
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
        * */
    }

    @Override
    public int insert(Classmodel classmodel) {
        System.out.println(classmodel+"实现类的数据");
        return classmodelMapper.insertSelective(classmodel);
    }

    @Override
    public int update(Classmodel classmodel) {
        return classmodelMapper.updateByPrimaryKeySelective(classmodel);
    }
}
