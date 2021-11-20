package com.axjy.vo.generalCharge;

import com.axjy.pojo.generalCharge.Groove;
import lombok.Data;

/**
 * Created by Joe on 2021/10/31 上午 11:49
 */
@Data
public class CostQueryVo extends Groove {
    private Integer limit;
    private Integer page;
}
