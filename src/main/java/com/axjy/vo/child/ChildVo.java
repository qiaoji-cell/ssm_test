package com.axjy.vo.child;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
public class ChildVo {
    private Integer classroomId;//班级
    private String studentName;//姓名
    private Integer status;//状态
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime createDate;//提醒开始事件
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime endDate;//提醒结束事件
    private Long gardenId;
    private Integer classId;
}
