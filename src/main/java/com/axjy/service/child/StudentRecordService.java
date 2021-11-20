package com.axjy.service.child;

import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.vo.child.StudentCodeVo;
import com.axjy.vo.generalCharge.FeeWithVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface StudentRecordService {
    PageInfo findAllFeeWith(FeeWithVo vo);
    /*根据在园和班级进行查询*/
    List<KmsStudentRecord> searchStatus(Integer statusId,Integer classroomId,Long gardenId);

    /*统计一月到十二月*/
    int yiyue(Long gardeId);
    int eryue(Long gardeId);
    int sanyue(Long gardeId);
    int siyue(Long gardeId);
    int wuyue(Long gardeId);
    int liuyue(Long gardeId);
    int qiyue(Long gardeId);
    int bayue(Long gardeId);
    int jiuyue(Long gardeId);
    int shiyue(Long gardeId);
    int shiyiyue(Long gardeId);
    int shieryue(Long gardeId);
    /*统计档案人数*/
    int recordCount(Long gardeId);
    PageInfo searchPage(Integer page, Integer limit, KmsStudentRecord studentRecord);
    PageInfo searchPageEr(Integer page, Integer limit, KmsStudentRecord studentRecord);
    int insert(KmsStudentRecord studentRecord);
    int update(KmsStudentRecord studentRecord);
    List<KmsStudentRecord> find(Long classroomId);
    int delete(String studentCode);
    void updateLot( StudentCodeVo codeVo);
}
