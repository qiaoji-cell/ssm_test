package com.axjy.vo.log;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/**
 * Created by Joe on 2021/10/26 下午 18:04
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LogQueryVo {
    private Integer limit;
    private Integer page;
    private String userCode;
    private String userName;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startTime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endTime;
    public LocalDate getEndTime(){
        if(endTime!=null){
            endTime.plusDays(1);
        }
        return endTime;
    }
}
