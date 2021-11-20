package com.axjy.mapper.child;

import com.axjy.pojo.child.KmsStudentRecord;
import com.axjy.vo.child.StudentCodeVo;
import com.axjy.vo.generalCharge.FeeWithTo;
import com.axjy.vo.generalCharge.FeeWithVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentRecordMapper {
    //查询 所有 档案学生的 伙保 关系 审批
    List<FeeWithTo> findAllFeeWith(FeeWithVo fee);

    /*查询档案人数*/
    int recordCount(Long gardeId);

    /*统计每个月份*/
    int yiyue(Long gardenId);
    int eryue(Long gardenId);
    int sanyue(Long gardenId);
    int siyue(Long gardenId);
    int wuyue(Long gardenId);
    int liuyue(Long gardenId);
    int qiyue(Long gardenId);
    int bayue(Long gardenId);
    int jiuyue(Long gardenId);
    int shiyue(Long gardenId);
    int shiyiyue(Long gardenId);
    int shieryue(Long gardenId);

    /*根据状态和班级查询*/
    List<KmsStudentRecord> searchStatus(@Param("statusId") Integer statusId,@Param("classroomId") Integer classroomId,@Param("gardenId") Long gardenId);

    List<KmsStudentRecord> queryFind(Long classroomId);

    List<KmsStudentRecord> find(KmsStudentRecord studentRecord);

    List<KmsStudentRecord> findEr(KmsStudentRecord studentRecord);

    void update(@Param("codeVo")StudentCodeVo codeVo);


    int delete(String studentCode);

    int deleteByPrimaryKey(Long id);

    int insert(KmsStudentRecord record);

    int insertSelective(KmsStudentRecord record);

    KmsStudentRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(KmsStudentRecord record);

    int updateByPrimaryKey(KmsStudentRecord record);
}