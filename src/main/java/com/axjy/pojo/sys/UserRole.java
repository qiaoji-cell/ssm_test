package com.axjy.pojo.sys;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * kms_user_role
 * @author 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRole implements Serializable {
    /**
     * 引用用户表
     */
    private Long userId;

    private Long[] userIds;

    /**
     * 角色id
     */
    private Long roleId;

    /**
     * 用户批量新增角色
     */
    private String[] roleIds;

    private static final long serialVersionUID = 1L;
}