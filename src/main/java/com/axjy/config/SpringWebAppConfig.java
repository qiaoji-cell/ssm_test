package com.axjy.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

/**
 * Created by Joe on 2021/09/22 上午 9:49
 * web 监听 转发
 */
public class SpringWebAppConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{RootConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{ServletConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    public void onStartup(ServletContext sc) throws ServletException {
        super.onStartup(sc);
        FilterRegistration.Dynamic dynamic = sc.addFilter("shiroFilter", new DelegatingFilterProxy());
        dynamic.addMappingForUrlPatterns(null,true,"/*");
        dynamic.setInitParameter("targetFilterLifecycle","true");
        dynamic.setInitParameter("targetBeanName","shiroFilter");
    }
}
