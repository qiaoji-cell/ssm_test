package com.axjy.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Joe on 2021/10/13 上午 9:14
 */
@Controller
@RequestMapping("/sys")
public class ErrorController {
    @GetMapping("/error/403")
    public String error(){
        return "error/403";
    }
}
