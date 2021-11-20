package com.axjy.pojo.sys;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_role_permission
 * @author 
 */
@Data
public class RolePermission implements Serializable {
    /**
     * 编号
     */
    private Long id;

    private Long roleId;

    private Long permId;

    /**
     * 某个角色操作的某个权限的状态
     */
    private boolean currState;

    /**
     * 操作某个角色权限关系的父级id 往里边新增角色权限关系
     */
    private Long parentId;

    private static final long serialVersionUID = 1L;
}