package com.axjy.pojo.base;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * kms_up_class_record
 * @author 
 */
@Data
public class UpClassRecord implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 变更日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate upDate;

    /**
     * 新班级
     */
    private String newClass;

    /**
     * 旧班级
     */
    private String oldClass;

    /**
     * 变更说明
     */
    private String upNote;

    /**
     * 用户编码
     */
    private String userCode;

    /**
     * 变更人
     */
    private String upUser;

    private String userName;

    private Integer classId;

    private static final long serialVersionUID = 1L;
}