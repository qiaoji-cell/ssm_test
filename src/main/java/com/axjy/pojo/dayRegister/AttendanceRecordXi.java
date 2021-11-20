package com.axjy.pojo.dayRegister;

import lombok.Data;

import java.io.Serializable;

@Data
public class AttendanceRecordXi implements Serializable {

	private static final long serialVersionUID =  1192441793207960965L;

	/**
	 * 编号
	 */
	private Integer id;

	private java.time.LocalDateTime attendanceDate;

	private String sunday;

	private Integer status;

	private String reason;

	private String registrant;

	private Integer recordId;


}
