package com.axjy.vo.recruit;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class ReturnVo {
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startWillIntoDate; //预计入园日期

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endWillIntoDate; //入园到止时间

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startReturnDate; //退费日期至

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endReturnDate;//退费日期至

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate startSetClassDate; //定班日期自

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endSetClassDate;//定班日期至

    private Long gardenId;

}
