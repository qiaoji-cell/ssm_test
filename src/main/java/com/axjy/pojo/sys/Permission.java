package com.axjy.pojo.sys;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

/**
 * kms_permission
 * @author joe
 */
@Data
public class Permission implements Serializable {
    /**
     * 编号
     */
    private Long id;

    /**
     * 权限名称
     */
    private String permName;

    /**
     * 类型
     */
    private String resourceType;

    /**
     * 图标
     */
    private String icon;

    /**
     * 权限编码
     */
    private String permCode;

    /**
     * 权限排序
     */
    private Integer sort;

    /**
     * 路径
     */
    private String url;

    /**
     * 父级id
     */
    private Long parentId;

    private boolean isHave;

    List<Permission> permissions = new ArrayList<>();

    private static final long serialVersionUID = 1L;
}