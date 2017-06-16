<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>


<%!private void dele(Connection conn, int id) {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			String sql = "select * from article where pid = " + id;
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				dele(conn, rs.getInt("id"));
			}
			stmt.executeUpdate("delete from article where id =" + id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
				if (rs != null) {
					rs.close();
					rs = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}%>
<%
	String admin = (String) session.getAttribute("admin");
	if (admin == null || !admin.equals("true")) {
		System.out.println("xxxxx");
		return;
	}
%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int pid = Integer.parseInt(request.getParameter("pid"));
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
	Connection conn = DriverManager.getConnection(url);
	String sql = "select count(*) from article where pid = " + pid;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	conn.setAutoCommit(false);
	dele(conn, id);
	rs.next();
	int count = rs.getInt(1);
	rs.close();
	stmt.close();
	if (count <= 0) {
		Statement stmtUp = conn.createStatement();
		stmtUp.executeUpdate("update article set isleaf=0 where id=" + pid);
		stmtUp.close();
	}

	conn.commit();
	conn.setAutoCommit(true);
	conn.close();
	response.sendRedirect("sgjz.jsp");
%>
