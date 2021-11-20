package com.axjy.config;

import com.axjy.shiro.DbRealm;
import net.sf.ehcache.Ehcache;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by Joe on 2021/09/26 上午 9:27
 */
@Configuration
public class ShiroConfig {
    @Resource
    private DbRealm realm;

    @Resource
    private HashedCredentialsMatcher hashedCredentialsMatcher;

    @Bean
    public DefaultWebSecurityManager securityManager(){
        DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
        realm.setCredentialsMatcher(hashedCredentialsMatcher);
        manager.setRealm(realm);
        //配置记住我 参考博客：
        manager.setRememberMeManager(rememberMeManager());
        //会话管理器
        manager.setSessionManager(sessionManager());
        return manager;
    }

    @Bean("shiroFilter")
    public ShiroFilterFactoryBean factoryBean(){
        ShiroFilterFactoryBean factoryBean = new ShiroFilterFactoryBean();
        factoryBean.setSecurityManager(securityManager());
        Map<String,String> filterChains = new LinkedHashMap<>();
        filterChains.put("/statics/**","anon");
        filterChains.put("/webjars/**","anon");
        //可匿名访问
        filterChains.put("/sys/user/login","anon");
        filterChains.put("/sys/user/403","anon");
        filterChains.put("/sys/user/captcha","anon");
        filterChains.put("/sys/user/autoLogin","anon");
        //退出过滤器
        filterChains.put("/logout","logout");
        //拦截所有
        filterChains.put("/**","authc");
        //设置过滤链
        factoryBean.setFilterChainDefinitionMap(filterChains);
        //登录失败重新跳转的页面
        factoryBean.setLoginUrl("/sys/user/login");
        //登录成功跳转的页面
        factoryBean.setSuccessUrl("/sys/user/index");
        //无权访问的页面
        factoryBean.setUnauthorizedUrl("/sys/error/403");

        return factoryBean;
    }

    /**
     * cookie对象;会话Cookie模板 ,默认为: JSESSIONID 问题: 与SERVLET容器名冲突,重新定义为sid或rememberMe，自定义
     * @return
     */
    @Bean
    public SimpleCookie rememberMeCookie(){
        //这个参数是cookie的名称，对应前端的checkbox的name = rememberMe
        SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
        //setcookie的httponly属性如果设为true的话，会增加对xss防护的安全系数。它有以下特点：

        //setcookie()的第七个参数
        //设为true后，只能通过http访问，javascript无法访问
        //防止xss读取cookie
        simpleCookie.setHttpOnly(true);
        simpleCookie.setPath("/");
        //<!-- 记住我cookie生效时间30天 ,单位秒;-->
        simpleCookie.setMaxAge(2592000);
        return simpleCookie;
    }

    /**
     * cookie管理对象;记住我功能,rememberMe管理器
     * @return
     */
    @Bean
    public CookieRememberMeManager rememberMeManager(){
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        cookieRememberMeManager.setCookie(rememberMeCookie());
        //rememberMe cookie加密的密钥 建议每个项目都不一样 默认AES算法 密钥长度(128 256 512 位)
        cookieRememberMeManager.setCipherKey(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));
        return cookieRememberMeManager;
    }
//
//    @Bean
//    public org.apache.shiro.cache.


    /**
     * 会话管理器
     * @return
     */
    @Bean
    public DefaultWebSessionManager sessionManager(){
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        //session失效时长，单位毫秒 设定60分钟 60*10*60*1000
        sessionManager.setGlobalSessionTimeout(60*10*60*1000);
        // 解决Shiro第一次重定向url携带jsessionid问题
        //将sessionIdUrlRewritingEnabled属性设置成false
        sessionManager.setSessionIdUrlRewritingEnabled(false);
        //删除失效的session
        sessionManager.setDeleteInvalidSessions(true);
        return sessionManager;
    }




}
