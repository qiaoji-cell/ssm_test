package com.axjy.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.axjy.shiro.DbRealm;
import com.github.pagehelper.PageInterceptor;
import lombok.SneakyThrows;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by Joe on 2021/09/22 上午 9:28
 * spring 容器配置
 */
@Configuration
@ComponentScan(basePackages = {"com.axjy.service","com.axjy.shiro","com.axjy.task"})
@MapperScan(basePackages = "com.axjy.mapper")
@PropertySource("classpath:application.properties")
@Import(ShiroConfig.class)
@EnableTransactionManagement
@EnableScheduling
public class RootConfig {

    @Resource
    private Environment ev;

    @Bean
    public DruidDataSource dataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(ev.getProperty("url"));
        dataSource.setUsername(ev.getProperty("jdbc.username"));
        dataSource.setPassword(ev.getProperty("password"));
        dataSource.setMaxActive(20);
        dataSource.setMinIdle(20);
        dataSource.setMaxWait(1000);
        dataSource.setRemoveAbandoned(true);//开启无用连接回收机制
        dataSource.setRemoveAbandonedTimeout(200);//回收时限
        return dataSource;
    }

    @Bean
    public PathMatchingResourcePatternResolver resolver(){
        return new PathMatchingResourcePatternResolver();
    }

    @Bean
    public PageInterceptor interceptor(){
        PageInterceptor pageInterceptor = new PageInterceptor();
        Properties properties = new Properties();
        properties.setProperty("pageSizeZero", "true");//分页尺寸为0时查询所有纪录不再执行分页
        properties.setProperty("reasonable", "true");//页码<=0 查询第一页，页码>=总页数查询最后一页
        properties.setProperty("supportMethodsArguments", "true");//支持通过 Mapper 接口参数来传递分页参数
        pageInterceptor.setProperties(properties);
        return pageInterceptor;
    }


    @SneakyThrows
    @Bean
    public SqlSessionFactoryBean factoryBean(){
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource());
        factoryBean.setMapperLocations(resolver().getResources("mapper/*.xml"));
        factoryBean.setConfigLocation(resolver().getResource("mybatis-config.xml"));
        factoryBean.setTypeAliasesPackage("com.axjy.pojo");
        factoryBean.setPlugins(interceptor());
        return factoryBean;
    }

    @Bean
    public DataSourceTransactionManager transactionManager(){
        DataSourceTransactionManager transactionManager = new DataSourceTransactionManager();
        transactionManager.setDataSource(dataSource());
        return transactionManager;
    }

    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher(){
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher();
        matcher.setHashAlgorithmName(ev.getProperty("shiro.alg"));
        matcher.setHashIterations(Integer.parseInt(ev.getProperty("shiro.iteration")));
        return matcher;
    }

    @Bean
    public PageInterceptor pageInterceptor(){
        PageInterceptor pageInterceptor = new PageInterceptor();
        return pageInterceptor;
    }


}
