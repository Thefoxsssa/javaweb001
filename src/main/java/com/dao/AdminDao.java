package com.dao;

import java.sql.*;

import com.beans.AdminInfo;
import com.jdbc.DBUtil;

public class AdminDao {

	public AdminInfo login(String username,String password) {
		String sql="select * from admininfo where adminName = ? and password = ?";
		return DBUtil.getObj(sql, AdminInfo.class, username,password);
	}
}
