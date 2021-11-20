package com.axjy.vo.recruit;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;

@Data
public class ReturnInfo {
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate returndate;
    private Integer returntype;
    private Integer returnway;
}
