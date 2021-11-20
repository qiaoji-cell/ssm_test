package com.axjy.service.base;

import com.axjy.pojo.base.Garden;
import com.axjy.vo.base.CodeNameVo;
import com.axjy.vo.base.GardenVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Joe on 2021/10/15 下午 17:15
 */
public interface GardenService {
    /**
     * 查询所有园所
     * @return 园所集合
     */
    PageInfo findAllGarden(GardenVo gardenVo);

    /**
     * 删除园所信息 查看当前园所是否有 收费记录,用户,仓库
     * @return boolean
     */
    boolean delGarden(Long[] ids);

    /**
     * 编辑园所信息 验证 园所编码 名称等
     * @return
     */
    boolean editGarden(Garden garden);

    /**
     * 添加园所
     * @return
     */
    boolean addGarden(Garden garden);

    Garden findByCode(CodeNameVo vo);

    Garden findByName(CodeNameVo vo);

    List<Garden> findAllGarden();

}
