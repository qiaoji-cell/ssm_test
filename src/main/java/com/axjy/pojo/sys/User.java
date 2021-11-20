package com.axjy.pojo.sys;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * kms_user
 * @author 
 */
@Data
public class User implements Serializable {
    /**
     * 引用部门
     */
    private Long depId;

    /**
     * 引用职位
     */
    private Long posId;

    /**
     * 编号
     */
    private Integer id;

    /**
     * 用户编码
     */
    private String user_code;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户密码
     */
    private String userPassword;

    /**
     * 颜值
     */
    private String salt;

    /**
     * 生日
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate birthday;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别
     */
    private Boolean gender;

    /**
     * 电话
     */
    private String phone;

    /**
     * 班级id 可无
     */
    private Long class_id;

    /**
     * 是否为采购人员
     */
    private Boolean is_purchase;

    /**
     * 是否为采购审批人员
     */
    private Boolean is_approve;

    /**
     * 是否查看物品金额
     */
    private Boolean is_watch;

    /**
     * 创建者
     */
    private Long created_by;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate creation_date;

    /**
     * 修改者
     */
    private Long modify_by;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDateTime modify_date;

    /**
     * 地址
     */
    private String address;

    /**
     * 隶属哪个园所
     */
    private Long garden_id;

    /**
     * 1 启用 2 禁用
     */
    private Long state;

    private String depName;

    private String roleName;

    private String posName;

    private String gardenName;

    private String internalPhone;

    private String officePhone;

    private Long roleId;

    private String roleIds;

    private Long roleIdList;
    private Business business;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate startDate;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate endDate;

    private Long realGardenId;

    private String loginTime;

    private static final long serialVersionUID = 1L;
}