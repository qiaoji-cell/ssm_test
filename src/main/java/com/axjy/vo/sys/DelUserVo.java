package com.axjy.vo.sys;

import lombok.Data;

/**
 * Created by Joe on 2021/10/23 下午 15:23
 */
@Data
public class DelUserVo {
    private Long userId;
    private Long roleId;
    private Long gardenId;
    private String roleIds;
}
