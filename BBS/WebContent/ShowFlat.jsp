<%@page import="javax.swing.text.StyledEditorKit.BoldAction"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>

<%
	String admin = (String) session.getAttribute("admin");
	if (admin != null && admin.equals("true"))
		login = true;
%>
<%!String str = "";
	boolean login = false;

	private void tree(Connection conn, int id, int level) {
		Statement stmt = null;
		ResultSet rs = null;
		String block = "";

		try {
			stmt = conn.createStatement();
			String sql = "select * from article where pid = " + id;
			rs = stmt.executeQuery(sql);
			String strLogin = "";
			while (rs.next()) {
				if (login) {
					strLogin = "<td><a href='Dele.jsp?id=" + rs.getInt("id") + "&pid=" + rs.getInt("pid")
							+ "' >É¾³ý</a></td>";
				}
				str += "<tr><td>" + rs.getInt("id") + "</td><td><a href ='ShowCont.jsp?id=" + rs.getInt("id") + "'>"
						+ block + rs.getString("title") + "</a></td>" + strLogin + "</tr>";
				if (rs.getInt("isleaf") != 0) {
					tree(conn, rs.getInt("id"), level + 1);
				}
			}
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
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
	Connection conn = DriverManager.getConnection(url);
	String sql = "select * from article where pid = 0";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	String strLogin = "";
	while (rs.next()) {
		if (login) {
			strLogin = "<td><a href='Dele.jsp?id=" + rs.getInt("id") + "&pid=" + rs.getInt("pid")
					+ "' >É¾³ý</a></td>";
		}
		str += "<tr><td>" + rs.getInt("id") + "</td><td><a href ='ShowCont2.jsp?id=" + rs.getInt("id") + "'>"
				+ rs.getString("title") + "</a></td>" + strLogin + "</tr>";

	}

	rs.close();
	stmt.close();
	conn.close();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>BBS</title>
</head>
<body>
	<table border="0">
		<tr>
			<td><a href="Post.jsp">·¢±íÐÂÌû</a></td>
		</tr>
		<%=str%>
		<%
			str = "";
			login = false;
		%>
	</table>

</body>

</html>