package com.axjy.controller.generalCharge;

import com.axjy.pojo.generalCharge.ChargeRecord;
import com.axjy.service.generalCharge.ChargeRecordService;
import com.axjy.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/11/05 下午 06:05
 */
@RestController
@RequestMapping("generalCharge")
public class ChargeRecordController {
    @Resource
    private ChargeRecordService chargeRecordService;

    @GetMapping("record/update")
    public Result update(ChargeRecord record,Integer state){
        record.setStudentState(state);
        try {
            chargeRecordService.updateState(record);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.success("缴费成功！");
    }

    /**
     * 真正的费用记录表里的列表
     * @param record
     * @return
     */
    @GetMapping("record/list")
    public Result list(ChargeRecord record){
        System.out.println("查询费用列表条件："+record);
        return Result.success(chargeRecordService.findAll(record));
    }

    /**
     * 用来测试查询到的费用列表
     * @return
     */
    @GetMapping("record/testGenerateRecords")
    public Result test(){
        return Result.success(chargeRecordService.generateRecord());
    }


    @GetMapping("record/generate")
    public Result generate(){
        try {
            List<ChargeRecord> records =  chargeRecordService.generateRecord();
            chargeRecordService.insertAllFee(records);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.success("已更新费用明细");
    }

}
