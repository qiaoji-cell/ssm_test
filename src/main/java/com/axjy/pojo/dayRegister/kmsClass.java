package com.axjy.pojo.dayRegister;

import lombok.Data;

import java.io.Serializable;

@Data
public class kmsClass implements Serializable {

	private static final long serialVersionUID =  8353073940230552172L;

	/**
	 * 编号
	 */
	private Integer id;

	/**
	 * 班级名称
	 */
	private String className;

	/**
	 * 年级id
	 */
	private Integer gradeId;

	/**
	 * 隶属哪个园所
	 */
	private Integer gardenId;


}
