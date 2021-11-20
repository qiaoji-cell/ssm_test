package com.axjy.vo.recruit;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/**
 * Created by Joe on 2021/10/13 上午 11:28
 */
@Data
public class CountVo {
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate willIntoDateStart; //入园
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate willIntoDateEnd;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate setclassDateStart;//定班
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate setclassDateEnd;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate returnDateStart;//退费
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate returnDateEnd;
    private Long gardenId;
    private Integer limit;
    private Integer page;
}
