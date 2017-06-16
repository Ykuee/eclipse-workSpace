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

public class nUser {
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
		String sql = "insert into user value(null, ?, ?, ?, ?, ?);";
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

	public static List<nUser> getUsers() {
		List<nUser> list = new ArrayList<nUser>();
		Connection conn = null;
		Statement stmt = null;
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		String sql = "select * from user;";
		ResultSet rs = DB.getRs(stmt, sql);
		try {
			while (rs.next()) {
				nUser u = new nUser();
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
		String sql = "delete from user where id =" + id;
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

	public static boolean loginIn(String username, String password,nUser u) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		String sql = "select * from user where username='" + username + "';";
		rs = DB.getRs(stmt, sql);
		try {
			rs.next();
			if (password.equals(rs.getString("password"))) {
				u.setAddr(rs.getString("addr"));
				u.setId(rs.getInt("id"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setUsername(rs.getString("username"));
				return true;
			}

		} catch (SQLException e) {
			System.out.println("用户不存在");
		} finally {
			DB.close(conn);
			DB.close(rs);
			DB.close(stmt);
		}
		return false;
	}

	public static nUser getUserInfo(String username) {
		nUser u = new nUser();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		String sql = "select * from user where username='" + username + "';";
		rs = DB.getRs(stmt, sql);
		try {
			rs.next();
			u.setId(rs.getInt("id"));
			u.setAddr(rs.getString("addr"));
			u.setUsername(rs.getString("username"));
			u.setPassword(rs.getString("password"));
			u.setPhone(rs.getString("phone"));
			u.setRdate(rs.getTimestamp("rdate"));

		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			DB.close(conn);
			DB.close(rs);
			DB.close(stmt);
		}
		return u;
	}

	public static void userUpdate(nUser u) {
		Connection conn = DB.getConn();

		// ("update article set isleaf = 1 where id =" + id);

		String sql = "update user set username=?,password=?,phone=?,addr=? where id ="+u.getId()+";";
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
