<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="java.sql.*" %>
<%@page import="com.ysnc.DB" %>
<%@page import="com.ysnc.User" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>我的DB到底怎么了</title>
<%

	String sql ="select * from user where id = 6;";
	Connection conn = DB.getConn();
	Statement stmt = DB.getStmt(conn);
	ResultSet rs = DB.getRs(stmt, sql);
	rs.next();
	String str = rs.getString("username");

/*
	String sql ="select * from user where id = 6;";
	User u = new User();
	u = u.getuser(sql);
*/
%>

</head>
<body>
怎么了？
</body>
</html>