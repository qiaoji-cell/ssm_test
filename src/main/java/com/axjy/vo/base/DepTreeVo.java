package com.axjy.vo.base;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.List;

/**
 * Created by Joe on 2021/10/18 上午 8:20
 */
@Data
public class DepTreeVo {
    private Long id;
    private Long pid;
    private String title;
    private boolean checked;
    private List<DepTreeVo> children;
    private boolean spread = true;

    /**
     * 部门编码
     */
    private String depCode;

    /**
     * 部门名称
     */
    private String depName;

    /**
     * 部门负责人
     */
    private String depPrincipal;

    /**
     * id 0顶层部门
     */
    private Long parentId;

    /**
     * 部门传真
     */
    private String depFax;

    /**
     * 部门电话
     */
    private String depPhone;

    /**
     * 部门类型 1.常规部门 2.销售部门 3.客服部门
     */
    private Long depType;

    /**
     * 部门备注
     */
    private String depRemark;

    /**
     * 隶属哪个园所
     */
    private Long gardenId;


//    private String authority;
//    private Long authorityId;
//    private String authorityName;
//    private Long parentId;
//    private Integer checked;
//    @JsonFormat(pattern = "yyyy-MM-dd")
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private LocalDate createTime;
//    private Integer isMenu;
//    private String menuIcon;
//    private Integer orderNumber;
//    @JsonFormat(pattern = "yyyy-MM-dd")
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private LocalDate updateTime;

}
