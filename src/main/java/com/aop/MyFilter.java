package com.aop;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException {
		HttpServletRequest re = (HttpServletRequest)request;
		HttpServletResponse res =(HttpServletResponse)response;
		res.setContentType("text/html;charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		String uri = re.getRequestURI();
		String context=re.getContextPath();
		String path[]= {
				context+"/images",
				context+"/css",
				context+"/js",
				context+"/login.html",
				context+"/UserServlet"
		};
		for(String o:path) {
			if(uri.startsWith(o)) {
				chain.doFilter(request, response);
				return;
			}
		}
		HttpSession session =re.getSession();
		if(session.getAttribute("session_admin")!=null) {
			chain.doFilter(request, response);
		}else {
			res.getWriter().print("<script>alert('会话超时,请重新登录');window.top.location.href='login.html'</script>");
		}
	}

}
