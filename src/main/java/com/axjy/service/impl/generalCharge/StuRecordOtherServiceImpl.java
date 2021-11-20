package com.axjy.service.impl.generalCharge;

import com.axjy.mapper.generalCharge.StuRecordOtherMapper;
import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.pojo.generalCharge.Groove;
import com.axjy.pojo.generalCharge.StuRecordOther;
import com.axjy.service.common.ClassService;
import com.axjy.service.generalCharge.StuRecordOtherService;
import com.axjy.vo.other.OtherFeeVo;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021/11/03 下午 11:00
 */
@Service("stuRecordOtherService")

public class StuRecordOtherServiceImpl implements StuRecordOtherService {

    @Resource
    private StuRecordOtherMapper stuRecordOtherMapper;
    @Resource
    private ClassService classService;

    @Override
    public void addSingleRecord(Long gardenId, Long stuId, Long[] costIds, OtherFeeVo se) {
        //添加时 过滤已包含的记录
        List<Long> oldCostIds= stuRecordOtherMapper.findCostIdsByStuId(stuId);

        System.out.println(oldCostIds);
        //声明新的数组
        Long[] newCostIds = new Long[]{};
        List<Long> costIdsList = new ArrayList<>();
        //循环将要添加的 费项id数组
        for(int i =0;i<costIds.length;i++){
            //如果包含 不再添加
            if(!oldCostIds.contains(costIds[i])){
                costIdsList.add(costIds[i]);
            }
        }
        newCostIds =costIdsList.toArray(newCostIds);
        if(newCostIds.length>0){
            stuRecordOtherMapper.insertRecord(stuId,newCostIds,se);
        }
    }

    @Override
    public void addRecord(Long gardenId, Long classId, Long[] costIds, OtherFeeVo se) {
        List<Long> stuIds = classService.findStuIdsByClassId(gardenId,classId);
        for (Long stuId : stuIds){
            //添加时 过滤已包含的记录
            List<Long> oldCostIds= stuRecordOtherMapper.findCostIdsByStuId(stuId);
            System.out.println(oldCostIds);
            //声明新的数组
            Long[] newCostIds = new Long[]{};
            List<Long> costIdsList = new ArrayList<>();
            //循环将要添加的 费项id数组
            for(int i =0;i<costIds.length;i++){
                //如果包含 不再添加
                if(!oldCostIds.contains(costIds[i])){
                    costIdsList.add(costIds[i]);
                }
            }
            newCostIds =costIdsList.toArray(newCostIds);
            if(newCostIds.length>0){
                stuRecordOtherMapper.insertRecord(stuId,newCostIds,se);
            }
        }
    }

    @Override
    public void upRecord(Long gardenId,Long classId,Long[] costIds,OtherFeeVo se) {
        List<Long> stuIds = classService.findStuIdsByClassId(gardenId,classId);
        for(Long stuId:stuIds){
            //先删掉原来的记录
            stuRecordOtherMapper.batchDel(stuId,costIds);
        }
        //再添加原来的记录
        addRecord(gardenId,classId,costIds,se);
    }

    @Override
    public List<Long> findCostIdsByStuId(Long stuId) {
        return stuRecordOtherMapper.findCostIdsByStuId(stuId);
    }

    @Override
    public List<StuRecordOther> findAllByStuId(Long stuId) {
        return stuRecordOtherMapper.findAllByStuId(stuId);
    }

    @Override
    public List<Groove> findAllNoByStuId(Long gardenId, Long stuId) {
        return stuRecordOtherMapper.findAllNoByStuId(gardenId,stuId);
    }

    @Override
    public void batchDel(Long stuId, Long[] ids) {
        stuRecordOtherMapper.batchDel(stuId,ids);
    }
}
