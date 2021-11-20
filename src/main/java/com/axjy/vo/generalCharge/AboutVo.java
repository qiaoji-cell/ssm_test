package com.axjy.vo.generalCharge;

import lombok.Data;

import java.util.List;

/**
 * Created by Joe on 2021/11/03 下午 03:00
 */
@Data
public class AboutVo {
    private Long id;
    private String title;
    private Integer gender;
    private Integer type;
    private List<AboutVo> children;
    private Integer stuClassId;
}
