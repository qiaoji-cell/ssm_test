package com.axjy.pojo.sys;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * kms_user_loginlog
 * @author 
 */
@Data
public class UserLog extends User implements Serializable {
    /**
     * 编号
     */
    private Long logId;

    /**
     * 用户信息  引用用户系统
     */
    private String userCode;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 登录ip
     */
    private String ip;

    /**
     * 登录地址
     */
    private String address;

    /**
     * 登录时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime loginDate;


    private static final long serialVersionUID = 1L;
}