package com.axjy.vo.recruit;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class KmsStudentVo {
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate willIntoDateStart; //预计入园日期
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate willIntoDateEnd; //入园到止时间

    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate setclassDateStart; //定班日期自
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate setclassDateEnd;//定班日期至


    private Long gardenId;

    public void setEndDate(LocalDate willIntoDateStart) {
        if (willIntoDateStart!=null){
            willIntoDateStart = willIntoDateStart.plusDays(1);
            this.willIntoDateStart = willIntoDateStart;
        }

    }
}
