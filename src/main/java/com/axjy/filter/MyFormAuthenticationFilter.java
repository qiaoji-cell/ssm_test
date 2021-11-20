package com.axjy.filter;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Joe on 2021/10/14 上午 9:49
 */
public class MyFormAuthenticationFilter extends FormAuthenticationFilter {
    @Override
    protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {
        WebUtils.issueRedirect(request,response,getSuccessUrl(),null,true);
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
//        //从session获取正确的验证码
//        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
//        HttpSession session = httpServletRequest.getSession();
//        //取出session的验证码(正确的验证码)
//        String validateCode = (String) session.getAttribute("captcha");
//        //取出页面的验证码
//        //输入的验证和session中的验证进行对比
//        String randCode = httpServletRequest.getParameter("captcha");
//        System.out.println("参数验证码："+randCode);
//        System.out.println("session验证码："+validateCode);
//
//        if(randCode!=null&&validateCode!=null&&!randCode.equals(validateCode)){
//            //如果校验失败，将验证错误失败信息，通过shiroLoginFailure设置到request中
//            httpServletRequest.setAttribute("shiroLoginFailure","验证码错误");
//
//            //拒绝访问，不再校验账号和密码
//            return true;
//        }

        return super.onAccessDenied(request, response);
    }
}
