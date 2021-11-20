package com.axjy.vo.sys;

import lombok.Data;

/**
 * Created by Joe on 2021/10/23 上午 10:00
 */
@Data
public class QueryUserVo extends QuickQueryVo{
    private Long depId;
    private Long gardenId;
}
