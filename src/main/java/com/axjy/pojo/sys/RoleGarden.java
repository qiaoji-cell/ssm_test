package com.axjy.pojo.sys;

import java.io.Serializable;
import lombok.Data;

/**
 * kms_role_garden
 * @author 
 */
@Data
public class RoleGarden implements Serializable {
    /**
     * 角色id 引用角色
     */
    private Long roleId;

    /**
     * 园所id 引用园所
     */
    private Long gardenId;

    private static final long serialVersionUID = 1L;
}