package com.axjy.service.sys;

import com.axjy.pojo.sys.Business;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Joe on 2021/10/17 下午 22:14
 */
@RequestMapping("/businessService")
public interface BusinessService {
    Business findById(Long id);

    void updateComp(Business business);
}
