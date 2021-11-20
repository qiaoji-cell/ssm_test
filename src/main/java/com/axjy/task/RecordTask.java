package com.axjy.task;

import com.axjy.service.generalCharge.ChargeRecordService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;


/**
 * Created by Joe on 2021/11/05 下午 06:16
 * 定时生成 费用记录的任务类
 */
@Component
public class RecordTask {
    @Resource
    private ChargeRecordService chargeRecordService;

    @Scheduled(cron = "0 0 0 1 * ?")
    public void setRecord(){
        chargeRecordService.generateRecord();
    }
}
