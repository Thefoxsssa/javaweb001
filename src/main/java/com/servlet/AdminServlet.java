package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.AdminInfo;
import com.dao.AdminDao;


@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag =request.getParameter("flag");
		if("add".equals(flag)) {
			add(request,response);
		}else if("manage".equals(flag)) {
			manage(request,response);
		}else if("newPass".equals(flag)) {
			newpass(request,response);
		}
	}


	private void newpass(HttpServletRequest request, HttpServletResponse response) {
		String admin =request.getParameter("adminName");
		String newpass =request.getParameter("newPassword");
		AdminDao dao =new AdminDao();
		dao.updatapass(admin,newpass);
		request.getSession().invalidate();
	}


	private void manage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDao ad = new AdminDao();
		List<AdminInfo> list=ad.getAdmin();
		request.setAttribute("AdminList", list);
		request.getRequestDispatcher("admin/admin_manage.jsp").forward(request, response);
	}


	private void add(HttpServletRequest request, HttpServletResponse response) {
		String admin = request.getParameter("adminName");
		String pass = request.getParameter("password");
		String note = request.getParameter("note");
		AdminInfo ai = new AdminInfo();
		ai.setAdminName(admin);
		ai.setNote(note);
		ai.setPassword(pass);
		ai.setRoleId(0);
		ai.setState(1);
		AdminDao ad = new AdminDao();
		ad.addAdmin(ai);
		
	}

}
