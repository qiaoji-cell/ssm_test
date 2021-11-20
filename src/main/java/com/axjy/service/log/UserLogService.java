package com.axjy.service.log;

import com.axjy.pojo.sys.UserLog;
import com.axjy.vo.log.LogQueryVo;

import java.util.List;

/**
 * Created by Joe on 2021/10/26 下午 18:19
 */
public interface UserLogService {

    List<UserLog> findAllLog(LogQueryVo vo);

    void addLog(UserLog log);
}
