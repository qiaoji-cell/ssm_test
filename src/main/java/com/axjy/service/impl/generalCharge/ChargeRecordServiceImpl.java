package com.axjy.service.impl.generalCharge;

import com.axjy.mapper.generalCharge.ChargeRecordMapper;
import com.axjy.pojo.generalCharge.ChargeRecord;
import com.axjy.service.generalCharge.ChargeRecordService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021/11/05 下午 05:53
 */
@Service("chargeRecordService")
public class ChargeRecordServiceImpl implements ChargeRecordService {

    @Resource
    private ChargeRecordMapper chargeRecordMapper;

    @Override
    public Integer countRecordByGrooveName(String grooveName) {
        return chargeRecordMapper.countByGrooveName(grooveName);
    }

    @Override
    public PageInfo findAll(ChargeRecord record) {
        PageHelper.startPage(record.getPage(),record.getLimit());
        List<ChargeRecord> records = chargeRecordMapper.findAll(record);
        PageInfo pageInfo = new PageInfo(records);
        return pageInfo;
    }

    @Override
    public void updateState(ChargeRecord chargeRecord) {
        chargeRecordMapper.updateState(chargeRecord);
    }

    /**
     * 不指定学生id 的 不指定园所的 动态生成的所有记录的列表 不可以操作 只能用来插入记录表
     * @return 需要插入到费项表的当月费项记录
     */
    @Override
    public List<ChargeRecord> generateRecord() {
        //未生成过本月 的记录 可以生成
        List<ChargeRecord> newRecords = chargeRecordMapper.generateRecord(null,null);
        //空条件查询所有已存在的记录
        List<ChargeRecord> oldRecords = chargeRecordMapper.findAll(new ChargeRecord());
        for(ChargeRecord oldRecord:oldRecords){
            //如果新生成的费项列表包含 指定学生的记录 移除新生成列表的项
            //通过学生id 和 费项名称 确认是否添加过该费项记录 添加过不再添加
            newRecords.removeIf(nRecord->{
                return nRecord.getStudentChargeGrooveName().equals(
                        oldRecord.getStudentChargeGrooveName())
                        && (nRecord.getStudentId()==oldRecord.getStudentId());
            });
        }
        System.out.println("要插入的记录："+newRecords);


        return newRecords;
    }

    /*统计每月收入*/
    @Override
    public Double yiyue(Long gardeId) {
        System.out.println( chargeRecordMapper.yiyue(gardeId)+"实现里的");
        double  qian= 0;

        if (chargeRecordMapper.yiyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.yiyue(gardeId);
        }

    }

    @Override
    public Double eryue(Long gardeId) {
        double  qian= 0;
        if (chargeRecordMapper.eryue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.eryue(gardeId);
        }
    }

    @Override
    public Double sanyue(Long gardeId) {

        double qian= 0;
        if (chargeRecordMapper.sanyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.sanyue(gardeId);
        }
    }

    @Override
    public Double siyue(Long gardeId) {
        double qian= 0;
        if (chargeRecordMapper.siyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.siyue(gardeId);
        }
    }

    @Override
    public Double wuyue(Long gardeId) {
        double qian= 0;
        if (chargeRecordMapper.wuyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.wuyue(gardeId);
        }

    }

    @Override
    public Double liuyue(Long gardeId) {
        double qian= 0;
        if (chargeRecordMapper.liuyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.liuyue(gardeId);
        }
    }

    @Override
    public Double qiyue(Long gardeId) {
        double qian= 0;
        if (chargeRecordMapper.qiyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.qiyue(gardeId);
        }

    }

    @Override
    public Double bayue(Long gardeId) {
        double qian= 0;
        if (chargeRecordMapper.bayue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.bayue(gardeId);
        }

    }

    @Override
    public Double jiuyue(Long gardeId) {

        double qian= 0;
        if (chargeRecordMapper.jiuyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.jiuyue(gardeId);
        }

    }

    @Override
    public Double shiyue(Long gardeId) {
        double qian= 0;
        if (chargeRecordMapper.shiyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.shiyue(gardeId);
        }

    }

    @Override
    public Double shiyiyue(Long gardeId) {
        double qian= 0;
        if (chargeRecordMapper.shiyiyue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.shiyiyue(gardeId);
        }

    }

    @Override
    public Double shieryue(Long gardeId) {
        double qian= 0;
        if (chargeRecordMapper.shieryue(gardeId)==null){
            return qian;
        }else{
            return chargeRecordMapper.shieryue(gardeId);
        }

    }

    @Override
    public Integer countThisMonth(LocalDate currentMonth) {
        return chargeRecordMapper.countThisMonth(currentMonth);
    }

    @Override
    public void insertAllFee(List<ChargeRecord> records) {
        if(records.size()>0){
            chargeRecordMapper.insertAll(records);
        }
    }

    @Override
    public ChargeRecord selectById(Long id) {
        return chargeRecordMapper.selectByPrimaryKey(id);
    }
}
