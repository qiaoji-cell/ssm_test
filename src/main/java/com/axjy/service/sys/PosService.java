package com.axjy.service.sys;

import com.axjy.pojo.sys.Pos;
import com.axjy.vo.sys.QuickQueryVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Joe on 2021/10/19 上午 8:55
 */
public interface PosService {
    PageInfo findAllPos(QuickQueryVo vo);

    List<Pos> findAllList(Long gardenId);

    void addPos(Pos pos);

    void delPos(Long[] posId);

    void updatePos(Pos pos);

    Pos findByName(String name, Long gardenId, Long posId);
}
