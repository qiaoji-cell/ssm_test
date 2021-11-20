package com.axjy.service.impl.common;

import com.axjy.mapper.common.ClassMapper;
import com.axjy.pojo.base.Class;
import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.pojo.recruit.Student;
import com.axjy.service.common.ClassService;
import com.axjy.vo.generalCharge.AboutVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("classService")
public class ClassServiceImpl implements ClassService  {

    @Resource
    private ClassMapper classMapper;

    @Override
    public Class findClass(Long gardenId) {
        return classMapper.find(gardenId);
    }
    @Override
    public List<Long> findStuIdsByClassId(Long gardenId,Long classId) {
        return classMapper.findStuIdsByClassId(gardenId,classId);
    }

    @Override
    public List<Class> find(Long gardenId) {
        return classMapper.findAll(gardenId);
    }

    @Override
    public List<AboutVo> findWithChild(Long gardenId) {
        List<Class> oldClassList = classMapper.findAll(gardenId);
        List<AboutVo> list = new ArrayList<>();
        for(Class cl:oldClassList){
            AboutVo aboutVo = new AboutVo();
            aboutVo.setId(cl.getId());
            aboutVo.setTitle(cl.getClassname());
            aboutVo.setType(1);
            System.out.println(cl);
            //通过查询每个班级的所有学生 及其id
            List<AboutVo> stuList = classMapper.findEachClassChildTree(gardenId,cl.getId());
            for(AboutVo stu:stuList){
                int gender = stu.getGender();
                if(gender==0){
                    stu.setTitle(stu.getTitle()+"（ 男 ）");
                }else{
                    stu.setTitle(stu.getTitle()+"（ 女 ）");
                }
                stu.setType(2);
                stu.setStuClassId(Integer.parseInt(String.valueOf(cl.getId())));
            }
            aboutVo.setTitle(aboutVo.getTitle()+"【总人数（ "+stuList.size()+" ）】");
            aboutVo.setChildren(stuList);
            list.add(aboutVo);
        }

        System.out.println(list);
        return list;
    }


    /**
     * 查询拼接园所名称的班级名称
     * @return
     */
    @Override
    public List<Class> findGardenClass() {
        List<Class> classList = classMapper.findGardenClass();
        return classList;
    }

    @Override
    public void batchAdd(Long gardenId) {
        classMapper.batchAdd(gardenId);
    }

    @Override
    public void batchDelClassByGardenId(Long[] ids) {
        classMapper.batchDelClassByGardenId(ids);
    }


}
