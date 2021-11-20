package com.axjy.vo.sys;

import lombok.Data;

import java.util.List;

/**
 * Created by Joe on 2021/10/21 下午 18:41
 */
@Data
public class ZTreeVo {
    private String name;
    private List<ZTreeVo> children;
    private Long id;
    private Long pId;
    private boolean open=true;
}
