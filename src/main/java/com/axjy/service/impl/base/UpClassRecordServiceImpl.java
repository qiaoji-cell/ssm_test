package com.axjy.service.impl.base;

import com.axjy.mapper.base.UpClassRecordMapper;
import com.axjy.pojo.base.UpClassRecord;
import com.axjy.service.base.UpClassRecordService;
import com.axjy.vo.base.SettingQuery;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/28 下午 17:07
 */
@Service("upClassRecordService")
public class UpClassRecordServiceImpl implements UpClassRecordService {
    @Resource
    private UpClassRecordMapper upClassRecordMapper;

    @Override
    public PageInfo findAllByUserCode(SettingQuery vo) {
        PageHelper.startPage(vo.getPage(),vo.getLimit());
        List<UpClassRecord> records = upClassRecordMapper.findAllByUserCode(vo.getUserCode());
        PageInfo pageInfo = new PageInfo(records);
        return pageInfo;
    }

    @Override
    public void addRecord(UpClassRecord record) {
        upClassRecordMapper.insert(record);
    }
}
