package com.axjy.pojo.sys;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

/**
 * kms_role
 * @author 
 */
@Data
public class Role implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 角色编码
     */
    private String roleCode;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 备注
     */
    private String roleRemark;

    /**
     * 创建者
     */
    private Long createdBy;

    /**
     * 创建时间
     */
    private LocalDateTime creationDate;

    /**
     * 修改者
     */
    private Long modifyBy;

    /**
     * 修改时间
     */
    private LocalDateTime modifyDate;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;



    private static final long serialVersionUID = 1L;
}