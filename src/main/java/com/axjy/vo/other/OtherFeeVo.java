package com.axjy.vo.other;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/**
 * Created by Joe on 2021/11/04 上午 06:18
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OtherFeeVo {
//    @JsonFormat(pattern = "yyyy-MM")
//    @DateTimeFormat(pattern = "yyyy-MM")
    private String startDate;
//    @JsonFormat(pattern = "yyyy-MM")
//    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate endDate;

    private Long gardenId;
    private Long classId;
    private Long[] ids;
    private Long stuId;
}
