package com.axjy.pojo;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_attendance_state
 * @author 
 */
@Data
public class AttendanceState implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 状态名称
     */
    private String statusname;

    private static final long serialVersionUID = 1L;
}