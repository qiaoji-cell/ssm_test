package com.axjy.vo.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Created by Joe on 2021/10/11 下午 15:20
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuVo {
    private Long Id;
    private Long pId;
    private String title;
    private String icon;
    private String href;
    private String target="_self";
    private List<MenuVo> child;
}
