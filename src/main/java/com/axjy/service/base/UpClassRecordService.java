package com.axjy.service.base;

import com.axjy.pojo.base.UpClassRecord;
import com.axjy.vo.base.SettingQuery;
import com.axjy.vo.sys.QueryUserVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Joe on 2021/10/28 下午 17:06
 */
public interface UpClassRecordService {
    PageInfo findAllByUserCode(SettingQuery vo);

    void addRecord(UpClassRecord record);
}
