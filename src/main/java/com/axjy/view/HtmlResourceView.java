package com.axjy.view;

import org.springframework.web.servlet.view.InternalResourceView;

import java.io.File;
import java.util.Locale;

/**
 * Created by Joe on 2021/09/26 上午 10:27
 */
public class HtmlResourceView extends InternalResourceView {
    @Override
    public boolean checkResource(Locale locale) throws Exception {
        File file  = new File(this.getServletContext().getRealPath("/")+getUrl());
        return file.exists();//判断该页面是否存在
    }
}
