package com.axjy.config;

import com.axjy.interceptor.UserInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.awt.*;

/**
 * Created by Joe on 2021/09/22 上午 9:45
 * spring mvc容器配置
 */
@Configuration
@ComponentScan(basePackages = "com.axjy.controller")
@EnableWebMvc
public class ServletConfig implements WebMvcConfigurer {

  //    配置jsp解析器
    @Bean
    public InternalResourceViewResolver JspResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        resolver.setOrder(1);
        return resolver;
    }

    //设置欢迎页 为首页
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("sys/user/login");
    }

    //配置静态资源
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");
        registry.addResourceHandler("/statics/**")
                .addResourceLocations("/statics/");
//        registry.addResourceHandler("/uploads")
//                .addResourceLocations("file:c:/");
        registry.addResourceHandler("/image/**")
                .addResourceLocations("file:c:/Users/Joe/Desktop/中期管理系统/managementSystem/src/main/webapp/attachement/");


    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new UserInterceptor()).addPathPatterns("/**");
    }

    //文件
    @Bean(value = "multipartResolver")
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setMaxUploadSize(500000);
        resolver.setDefaultEncoding("UTF-8");
        return resolver;
    }
}
