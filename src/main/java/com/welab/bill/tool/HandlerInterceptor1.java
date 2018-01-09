package com.welab.bill.tool;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.jws.HandlerChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @package: com.welab.bill.tool
 * @author: qing
 * @date: 2018/1/7
 * @time: 15:09
 **/

public class HandlerInterceptor1 extends HandlerInterceptorAdapter {
    @Override
    public void afterCompletion(HttpServletRequest arg0,
                                HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest ag0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception {
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object arg2) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("username")!=null) {
            return true;
        } else {
            response.sendRedirect("/login.jsp");
            return false;
        }
    }
}
