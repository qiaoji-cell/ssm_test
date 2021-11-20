package com.axjy.vo.base;

import com.axjy.pojo.base.Class;
import com.axjy.pojo.sys.User;
import lombok.Data;

/**
 * Created by Joe on 2021/10/28 下午 14:38
 */
@Data
public class SettingUserTo extends User {
    private Class beLongClass;
}
