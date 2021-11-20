package com.axjy.pojo.recruit;

import lombok.Data;

import java.io.Serializable;

@Data
public class Gard implements Serializable {

	private static final long serialVersionUID =  4839484502474239872L;

	/**
	 * 编号
	 */
	private Integer id;

	/**
	 * 园所编码
	 */
	private String gardenCode;

	/**
	 * 园所名称
	 */
	private String gardenName;

	/**
	 * 负责人
	 */
	private String gardenPrincipal;

	/**
	 * 电话
	 */
	private String phone;

	/**
	 * 传真
	 */
	private String fax;

	/**
	 * 备注
	 */
	private String remark;

	/**
	 * 收/退款单号后缀 幼儿学号前缀
	 */
	private String prefixSuffix;

	/**
	 * 引用收退费规则表
	 */
	private Integer gardenRuleId;

	/**
	 * 引用收退费规则表
	 */
	private Integer normalRuleId;


}
