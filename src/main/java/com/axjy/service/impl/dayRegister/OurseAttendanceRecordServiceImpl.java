package com.axjy.service.impl.dayRegister;

import com.axjy.mapper.dayRegister.OurseAttendanceRecordMapper;
import com.axjy.pojo.teach.Classmodel;
import com.axjy.pojo.dayRegister.OurseAttendanceRecord;
import com.axjy.service.dayRegister.OurseAttendanceRecordService;
import com.axjy.vo.dayRegisterVo.DayVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("OurseAttendanceRecordService")
public class OurseAttendanceRecordServiceImpl implements OurseAttendanceRecordService {

    @Resource
    private OurseAttendanceRecordMapper ourseAttendanceRecordMapper;

    /**
     * 课程考试显示数据
     * 分页
     * 条件查询
     * @param page
     * @param limit
     * @param ourseAttendanceRecord
     * @return
     */
    @Override
    public PageInfo findAll(Integer page, Integer limit, OurseAttendanceRecord ourseAttendanceRecord) {
        PageHelper.startPage(page,limit);
        List<OurseAttendanceRecord> list = ourseAttendanceRecordMapper.findAll(ourseAttendanceRecord);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    /**
     * 班型
     * @return
     */
    @Override
    public List<Classmodel> findAl() {
        return ourseAttendanceRecordMapper.findAl();
    }

    /**
     * 批量删除
     * @param ids
     */
    @Override
    public void pldelete(Integer[] ids) {
        ourseAttendanceRecordMapper.pl(ids);
    }


//    课程考勤登记修改
    @Override
    public void djup(DayVo dayvo) {
        ourseAttendanceRecordMapper.djup(dayvo);
    }


}
