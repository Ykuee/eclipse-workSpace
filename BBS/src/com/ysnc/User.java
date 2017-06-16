package com.ysnc;
import com.ysnc.DB;
import java.sql.*;

public class User {
	private int id;
	private String username;
	private String email;
	private String password;
	
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
	public static User getuser(String sql){
		User u = new User();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		rs = DB.getRs(stmt, sql);
		try {
			if(rs.next()){
				System.out.println(rs.getString("username"));
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.close(conn);
			DB.close(stmt);
			DB.close(rs);
			
		}
		
		return u;
	}
}
