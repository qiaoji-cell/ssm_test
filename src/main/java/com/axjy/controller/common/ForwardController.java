package com.axjy.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * Created by Joe on 2021/09/29 下午 19:02
 */
@Controller
public class ForwardController {

    //统一前进到index
    @GetMapping("{folder1}/{folder2}/index")
    public String index(@PathVariable("folder1")String folder1,
                        @PathVariable("folder2")String folder2){
        return folder1+"/"+folder2+ "/"+"index";
    }



}
