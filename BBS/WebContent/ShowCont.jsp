<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%
	String sid = request.getParameter("id");
	int id = Integer.parseInt(sid);
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
	Connection conn = DriverManager.getConnection(url);
	String sql = "select * from article where id =" + id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<title>ShowCont</title>
</head>
<body>
	<%
		if (rs.next()) {
	%>
	<table>
		<tr>
			<td>ID</td>
			<td><%=rs.getInt("id")%></td>
		</tr>
		<tr>
			<td>Title</td>
			<td><%=rs.getString("title")%></td>
		</tr>
		<tr>
			<td>Contents</td>
			<td><%=rs.getString("cont")%></td>
		</tr>

	</table>



	<a
		href="Reply.jsp?id=<%=rs.getInt("id")%>&rootid=<%=rs.getInt("rootid")%>">回复</a>
	<%
		}
		rs.close();
		stmt.close();
		conn.close();
	%>
</body>
</html>