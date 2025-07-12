package com.jiat.mvc.core.filter;

import com.jiat.mvc.core.route.Routing;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Achintha
 */
@WebFilter(filterName = "RequestFilter", urlPatterns = "/*")
public class RequestFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //System.out.println("RequestFilter...");
        HttpServletRequest hsr = (HttpServletRequest)request;
        
        String path = hsr.getRequestURI().substring(hsr.getContextPath().length());
        if (Routing.hasRoute(hsr.getMethod(),path)) {
                           System.out.println("filter ");

            hsr.getRequestDispatcher("/app/"+path).forward(request, response);
        }else{
            chain.doFilter(request, response);
               System.out.println("filter else");
        }
    }

    @Override
    public void destroy() {

    }

}
