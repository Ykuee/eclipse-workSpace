<%@page import="sun.security.util.Password"%>
<%@page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@page import="com.ysnc.DB" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel="stylesheet" href="imgs/css/reset.css">
<link rel="stylesheet" href="imgs/css/supersized.css">
<link rel="stylesheet" href="imgs/css/style.css">
<title>Login</title>
<%
	String username = request.getParameter("username");
	String passwrod = request.getParameter("password");

	String sql = "select * from user where username='" + username + "';";
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
	Connection conn = DriverManager.getConnection(url);
	
	Statement stmt = conn.createStatement();
	ResultSet rs = DB.getRs(stmt, sql);

	if (rs.next() && passwrod.equals(rs.getString("password"))) {
		session.setAttribute("admin", "true");
		response.sendRedirect("sgjz.jsp");

%>
</head>
<body>
	<%
		} else {
	%>
	<div class="page-container">
		<h1>
			<a href='index.html'>用户名或密码不正确，点此重新登录</a>
		</h1>
	</div>
	<%
		}
	%>
	<script src="imgs/js/jquery-1.8.2.min.js"></script>
	<script src="imgs/js/supersized.3.2.7.min.js"></script>
	<script src="imgs/js/supersized-init.js"></script>
	<script src="imgs/js/scripts.js"></script>

</body>
</html>