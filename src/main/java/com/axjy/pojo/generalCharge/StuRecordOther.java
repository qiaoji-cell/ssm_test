package com.axjy.pojo.generalCharge;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.ibatis.annotations.Param;

/**
 * kms_stu_record_other
 * @author 
 */
@Data
public class StuRecordOther implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 档案学生记录表的学生id 录入学生id就进行记录到 一条新的关系表
     */
    private Long stuId;

    /**
     * 其他费项的id
     */
    private Long grooveCostId;

    /**
     * 费用开始日期
     */
    @JsonFormat(pattern = "yyyy-MM")
    private LocalDateTime startDate;

    /**
     * 费用结束日期
     */
    @JsonFormat(pattern = "yyyy-MM")
    private LocalDateTime endDate;

    private Groove groove;

    private static final long serialVersionUID = 1L;
}