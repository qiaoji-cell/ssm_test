package com.axjy.vo.generalCharge;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Created by Joe on 2021/11/01 下午 05:19
 * 费项关联vo
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeeWithVo {
    private Long gradeId;
    private Long classroomId;
    private String studentName;
    private Long statusId;
    private Long gardenId;
    private Integer approvalState;
    private Integer page;
    private Integer limit;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startDate;//提醒开始事件
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;//提醒结束事件
    public LocalDate getEndDate(){
        if(endDate!=null){
            endDate=endDate.plusDays(1);
        }
        return endDate;
    }
}
