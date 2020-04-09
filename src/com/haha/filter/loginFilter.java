package com.haha.filter;

import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class loginFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        String uri = request.getRequestURI();
        System.out.println(uri);
        System.out.println(user);
        if(uri.contains("login")||uri.contains("logout")||uri.contains("toRegister")||uri.contains("signup")||uri.contains("checkok")){
            filterChain.doFilter(request,response);
            return;
        }

        if(user==null){
            response.sendRedirect("/VoteSystem_war_exploded/");
            return;
        }
        else{
            filterChain.doFilter(request,response);
            return;
        }
    }
}
