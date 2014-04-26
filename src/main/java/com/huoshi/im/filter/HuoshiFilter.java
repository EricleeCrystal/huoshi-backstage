package com.huoshi.im.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class HuoshiFilter extends StrutsPrepareAndExecuteFilter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        String uri = request.getRequestURI();

        // home page
        if (uri.equals(request.getContextPath() + "/")) {
            req.getRequestDispatcher("index.html").forward(req, res);
            return;
        }

        // 直接访问jsp或者静态文件
        if (uri.endsWith(".jsp") || uri.contains("/static/")) {
            String path = uri.substring(uri.lastIndexOf("/") + 1);
            req.getRequestDispatcher(path).forward(req, res);
            return;
        }
        super.doFilter(req, res, chain);
    }
}
