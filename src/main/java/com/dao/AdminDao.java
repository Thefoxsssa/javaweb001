package com.dao;

import java.sql.*;

import com.beans.AdminInfo;
import com.jdbc.DBUtil;

public class AdminDao {
	public AdminInfo login(String username,String password) {
		String sql="select * from admininfo where adminName = ? and password = ?";
		return DBUtil.getObj(sql, AdminInfo.class, username,password);
	}

	public void addAdmin(AdminInfo ai) {
		Connection conn=null;
		String sql = "Insert into admininfo(note,password,adminName,state,roleId) values(?,?,?,?,?)";
		Object parems[]= {
				ai.getNote(),
				ai.getPassword(),
				ai.getAdminName(),
				ai.getState(),
				ai.getRoleId()
		};
		try {
			conn=DBUtil.getDBUtil();
			DBUtil.upData(sql, parems);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
	}
	
}
