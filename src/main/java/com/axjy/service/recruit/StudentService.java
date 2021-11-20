package com.axjy.service.recruit;

import com.axjy.pojo.recruit.Student;
import com.axjy.vo.recruit.CountVo;
import com.axjy.vo.recruit.KmsStudentVo;
import com.axjy.vo.recruit.ReturnDetailVo;
import com.axjy.vo.recruit.ReturnVo;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Joe on 2021/10/13 下午 18:11
 */
public interface StudentService {
    /**
     *
     * @param countVo
     * @param student
     * @return
     */
    PageInfo findAllStudent(CountVo countVo, Student student);

    /**
     * 招生录入
     * 分页
     * 查询条件
     * @param page
     * @param limit
     * @return
     */
    PageInfo searchPage(Integer page, Integer limit, Student student, KmsStudentVo kmsStudentVo);

    /**
     *
     * @param page
     * @param limit
     * @param student
     * @param returnVo
     * @return
     */
    PageInfo searchPageReturn(Integer page, Integer limit, Student student, ReturnVo returnVo);

    /**
     * 招生统计幼儿总人数
     */
    int zongrenshu(Student student);

    /**
     * 新增
     * @param student
     */
    void add(Student student);

    /***
     * 修改
     * @param student
     */
    void update(Student student);


    /**
     * 删除
     * @param id
     */
    void del(Long id);


    /**
     * 招生统计金额总和
     */
    int moneyhe(Student student);

    /**
     * 招生统计已退费总和
     * @return
     */
    int tuifeizonghe(Student student);

    /**
     * 招生统计入园人数
     * @return
     */
    int ruyuan(Student student);
    /**
     * 招生统计未退费
     */
    int weituifei(Student student);
    /**
     * 退费
     */
    void up(Student student);

    /**
     *
     * @param returnDetailVo
     */
    void tupdate(@Param(value = "returnDetailVo") ReturnDetailVo returnDetailVo);

}
