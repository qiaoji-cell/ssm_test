package com.axjy.vo.base;

import lombok.Data;

/**
 * Created by Joe on 2021/10/28 下午 14:20
 */
@Data
public class SettingQuery {
    private Integer page;
    private Integer limit;
    private Integer state;
    private Long depId;
    private String field;
    private String value;
    private Boolean is_watch = false;
    private Boolean is_purchase = false;
    private Boolean is_approve = false;
    private String userCode;
    private Long gardenId;
}
