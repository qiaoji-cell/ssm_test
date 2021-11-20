package com.axjy.vo.sys;

import lombok.Data;

/**
 * Created by Joe on 2021/10/19 上午 11:43
 */
@Data
public class QuickQueryVo {
    private Integer page;
    private Integer limit;
    private String field;
    private String value;
    private Long gardenId;
    private String keyword;
}
