package com.jdbc;

import java.sql.*;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.util.*;
import com.beans.AdminInfo;
import com.mchange.v2.c3p0.ComboPooledDataSource;



public class DBUtil {
	
	public static void main(String[] args) throws SQLException {
		String sql = "select * from admininfo";
		List<AdminInfo> list = DBUtil.getObjs(sql, AdminInfo.class);
		for(Object o : list) {
			System.err.println(o);
		}
		
	}
	public static DataSource data;
	public static QueryRunner qr;
	static {
		data = new ComboPooledDataSource("mysql");
		qr = new QueryRunner();
	}
	public static Connection getDBUtil() {
		Connection conn = null;
		try {
			conn = data.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return conn;
	}
	
	public static void close(Connection conn,Statement st,ResultSet re) {
		if(conn!=null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		if(st!=null) {try {st.close();} catch (SQLException e) {e.printStackTrace();}}
		if(re!=null) {try {re.close();} catch (SQLException e) {e.printStackTrace();}}
	}
	
	/**
	 * @param sql 要执行的sql语句占位符只能时values不能时字段
	 * @param parmas 占位符的值
	 * @return 返回值为影响的行数
	 */
	public static int upData(String sql,Object... parmas) {
		Connection conn = null;
		
		try {
			conn=DBUtil.getDBUtil();
			
			return qr.update(conn,sql,parmas);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			DBUtil.close(conn, null, null);
		}
		
	}
	
	/**
	 * @param sql 要执行的sql语句
	 * @param parmas 占位符的值
	 * @return 返回自增键
	 */
	public static int addGetid(String sql,Object... parmas) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet re =null;
		try {
			conn=DBUtil.getDBUtil();
			st = conn.prepareStatement(sql,1);
			for(int i=0;i<parmas.length;i++) {
				st.setObject(i+1, parmas[i]);
			}
			st.executeUpdate();
			re=st.getGeneratedKeys();
			re.next();
			int id = re.getInt(1);
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			DBUtil.close(conn, null, null);
		}
		
	}
	/**
	 * @param <T> 将查询的数据转成对应的类对象
	 * @param sql 要执行的sql语句
	 * @param clazz 类型
	 * @param parmas 占位符参数
	 * @return
	 */
	public static <T> T getObj(String sql,Class<T> clazz,Object... parmas) {
		Connection conn = null;

		try {
			conn=DBUtil.getDBUtil();
			return qr.query(conn,sql,new BeanHandler<>(clazz),parmas);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			DBUtil.close(conn, null, null);
		}
	}
	/**
	 * @param <T> 集合中的数据类型
	 * @param sql 要执行的sql语句
	 * @param clazz 类型
	 * @param parmas 参数
	 * @return list集合
	 */
	public static <T> List<T> getObjs(String sql,Class<T> clazz,Object... parmas) {
		Connection conn = null;

		try {
			conn=DBUtil.getDBUtil();
			return qr.query(conn,sql,new BeanListHandler<>(clazz),parmas);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			DBUtil.close(conn, null, null);
		}
	}
	/**取单一值如count(*)
	 * @param <T> 泛型
	 * @param sql 要执行的sql语句
	 * @param parmas 参数
	 * @return
	 */
	public static <T> T getScalar(String sql,Object... parmas) {
		Connection conn = null;

		try {
			conn=DBUtil.getDBUtil();
			return qr.query(conn,sql,new ScalarHandler<T>(),parmas);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			DBUtil.close(conn, null, null);
		}
	}
	public static <T> List<T>  getCol(String sql,Object... parmas) {
		Connection conn = null;

		try {
			conn=DBUtil.getDBUtil();
			return qr.query(conn,sql,new ColumnListHandler<T>(),parmas);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			DBUtil.close(conn, null, null);
		}
	}
}
