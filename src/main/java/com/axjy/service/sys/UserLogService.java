package com.axjy.service.sys;

import com.axjy.pojo.sys.UserLog;
import com.axjy.vo.log.LogQueryVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Joe on 2021/10/26 下午 18:19
 */

public interface UserLogService {

    PageInfo findAllLog(LogQueryVo vo);

    //统计登录次数
    Integer countTime(String userCode);

    //登录后向后台发送登录ip和地址等信息
    void addLog(UserLog log);
}
