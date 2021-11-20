package com.axjy.service.impl.teach;

import com.axjy.mapper.teach.ClassroomMapper;
import com.axjy.pojo.teach.Classroom;
import com.axjy.service.teach.ClassroomService;
import com.axjy.vo.teach.ClassroomVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("classroomService")
public class ClassroomServiceImpl implements ClassroomService {
    @Resource
    private ClassroomMapper classroomMapper;
    /*查询教室*/
    @Override
    public PageInfo searchPage(Integer page, Integer limit, ClassroomVo classroomVo) {
        PageHelper.startPage(page,limit);
        System.out.println("到这里啦!");
        List<Classroom> list= classroomMapper.find(classroomVo);
        System.out.println(list+"--------------------");
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<Classroom> find(ClassroomVo classroomVo) {
        List<Classroom> list = classroomMapper.find(classroomVo);
        return list;
    }


    @Override
    public int update(Classroom classroom) {

        return  classroomMapper.updateByPrimaryKeySelective(classroom);
    }

    /*增加教室*/
    @Override
    public int insert(Classroom classroom) {
        return classroomMapper.insert(classroom);
    }

    @Override
    public int delete(Long id) {
        return classroomMapper.deleteByPrimaryKey(id);
    }
}
