package com.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.AdminInfo;
import com.jdbc.DBUtil;


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;UTF-8");
		String flag = request.getParameter("flag");
		if("login".equals(flag)) {
			login(request,response);
		}
		
		
	}



	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;UTF-8");
		String user =request.getParameter("userName");
		String pass =request.getParameter("password");
		String sql = "select * from admininfo where adminName = ? and password = ?";
		AdminInfo ad = DBUtil.getObj(sql, AdminInfo.class, user,pass);
		
		if(ad==null) {
			response.getWriter().print("1");
		}else if(ad.getState() == 2) {
			response.getWriter().print("2");
		}else {
			request.getSession().setAttribute("session_admin", ad);
			response.getWriter().print("0");
			
		}
		
		
	}

}
