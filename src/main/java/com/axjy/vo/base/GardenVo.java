package com.axjy.vo.base;

import lombok.Data;

/**
 * Created by Joe on 2021/10/15 下午 18:20
 */
@Data
public class GardenVo {
    private Integer page;
    private Integer limit;
    private String field;
    private String value;
}
