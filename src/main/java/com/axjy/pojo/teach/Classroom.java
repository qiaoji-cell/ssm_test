package com.axjy.pojo.teach;

import lombok.Data;

import java.io.Serializable;

/**
 * kms_classroom
 * @author 
 */
@Data
public class Classroom implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 教室名称
     */
    private String gradename;

    /**
     * 容纳人数
     */
    private Integer conttainNum;

    /**
     * 教室状态（正常  满员）
     */
    private Integer roomState;

    /**
     * 备注
     */
    private String remark;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;

    /*
    * 所属园所名称！
    * */
    private String gardenName;

    private static final long serialVersionUID = 1L;
}