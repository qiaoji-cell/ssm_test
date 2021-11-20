package com.axjy.service.impl.child;

import com.axjy.mapper.child.StudentRecordMapper;
import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.service.child.StudentRecordService;
import com.axjy.vo.child.StudentCodeVo;
import com.axjy.vo.generalCharge.FeeWithTo;
import com.axjy.vo.generalCharge.FeeWithVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("recordService")
public class StudentRecordServiceImpl implements StudentRecordService {
    @Resource
    private StudentRecordMapper recordMapper;

    @Override
    public List<KmsStudentRecord> searchStatus(Integer statusId, Integer classroomId,Long gardenId) {
        return recordMapper.searchStatus(statusId,classroomId,gardenId);
    }

    @Override
    public PageInfo findAllFeeWith(FeeWithVo vo) {
        PageHelper.startPage(vo.getPage(),vo.getLimit());
        List<FeeWithTo> list = recordMapper.findAllFeeWith(vo);

        for(FeeWithTo to:list){

        }


        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
    @Override
    public int yiyue(Long gardeId) {
        return recordMapper.yiyue(gardeId);
    }

    @Override
    public int eryue(Long gardeId) {
        return recordMapper.eryue(gardeId);
    }

    @Override
    public int sanyue(Long gardeId) {
        return recordMapper.sanyue(gardeId);
    }

    @Override
    public int siyue(Long gardeId) {
        return recordMapper.siyue(gardeId);
    }

    @Override
    public int wuyue(Long gardeId) {
        return recordMapper.wuyue(gardeId);
    }

    @Override
    public int liuyue(Long gardeId) {
        return recordMapper.liuyue(gardeId);
    }

    @Override
    public int qiyue(Long gardeId) {
        return recordMapper.qiyue(gardeId);
    }

    @Override
    public int bayue(Long gardeId) {
        return recordMapper.bayue(gardeId);
    }

    @Override
    public int jiuyue(Long gardeId) {
        return recordMapper.jiuyue(gardeId);
    }

    @Override
    public int shiyue(Long gardeId) {
        return recordMapper.shiyue(gardeId);
    }

    @Override
    public int shiyiyue(Long gardeId) {
        return recordMapper.shiyiyue(gardeId);
    }

    @Override
    public int shieryue(Long gardeId) {
        return recordMapper.shieryue(gardeId);
    }


    @Override
    public int recordCount(Long gardeId) {
        return recordMapper.recordCount(gardeId);
    }

    @Override
    public PageInfo searchPage(Integer page, Integer limit,KmsStudentRecord studentRecord) {
        PageHelper.startPage(page,limit);
        List<KmsStudentRecord> list= recordMapper.find(studentRecord);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public PageInfo searchPageEr(Integer page, Integer limit, KmsStudentRecord studentRecord) {
        PageHelper.startPage(page,limit);
        List<KmsStudentRecord> list= recordMapper.findEr(studentRecord);
        System.out.println(list+"--------------的提醒的查询");
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public int insert(KmsStudentRecord studentRecord) {

        return  recordMapper.insertSelective(studentRecord);
    }

    @Override
    public int update(KmsStudentRecord studentRecord) {
        return recordMapper.updateByPrimaryKeySelective(studentRecord);
    }

    @Override
    public List<KmsStudentRecord> find(Long classroomId) {

        return recordMapper.queryFind(classroomId);
    }

    @Override
    public int delete(String studentCode) {
        return recordMapper.delete(studentCode);
    }

    @Override
    public void updateLot(StudentCodeVo codeVo) {
        recordMapper.update(codeVo);
    }


}
