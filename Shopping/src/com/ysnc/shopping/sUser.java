package com.ysnc.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ysnc.util.DB;

public class sUser {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Date rdate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public void save() {
		Connection conn = DB.getConn();
		String sql = "insert into suser value(null, ?, ?, ?, ?, ?);";
		PreparedStatement pStmt = DB.getpStmt(conn, sql);
		try {
			pStmt.setString(1, username);
			pStmt.setString(2, password);
			pStmt.setString(3, phone);
			pStmt.setString(4, addr);
			pStmt.setTimestamp(5, new Timestamp(rdate.getTime()));
			pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB.close(pStmt);
			DB.close(conn);
		}
	}

	public static List<sUser> getUsers() {
		List<sUser> list = new ArrayList<sUser>();
		Connection conn = null;
		Statement stmt = null;
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		String sql = "select * from suser;";
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			while (rs.next()) {
				sUser u = new sUser();
				u.setId(rs.getInt("id"));
				u.setAddr(rs.getString("addr"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB.close(conn);
			DB.close(stmt);
			DB.close(rs);
		}
		return list;
	}

	public static void deleUser(int id) {
		Connection conn = null;
		Statement stmt = null;
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		String sql = "delete from suser where id =" + id;
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB.close(conn);
			DB.close(stmt);
		}
	}

	public static boolean loginIn(String username, String password) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		String sql = "select username,password from suser where username='"+username+"';";
		rs = DB.getRs(stmt, sql);
		try {
			if (rs.next()&&password.equals(rs.getString("password"))){
				return true;
			}

		} catch (SQLException e) {
			System.out.println("用户不存在");
		}finally{
			DB.close(conn);
			DB.close(stmt);
			DB.close(rs);
		}
		return false;
	}
	public static void userUpdate(sUser u) {
		Connection conn = DB.getConn();

		// ("update article set isleaf = 1 where id =" + id);

		String sql = "update suser set username=?,password=?,phone=?,addr=? where id ="+u.getId()+";";
		PreparedStatement pStmt = DB.getpStmt(conn, sql);
		try {
			pStmt.setString(1, u.getUsername());
			pStmt.setString(2, u.getPassword());
			pStmt.setString(3, u.getPhone());
			pStmt.setString(4, u.getAddr());
			pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB.close(pStmt);
			DB.close(conn);
		}
	}

}
