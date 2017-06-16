<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>注册成功！！！</title>

<%
	request.setCharacterEncoding("gbk");
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
	Connection conn = DriverManager.getConnection(url);
	conn.setAutoCommit(false);
	
	String sql = "insert into user (username, email, password) values (?, ?, ?)";
	PreparedStatement pstm = conn.prepareStatement(sql);
	Statement stmt = conn.createStatement();

	pstm.setString(1, username);
	pstm.setString(2, email);
	pstm.setString(3, password);
	pstm.executeUpdate();
	conn.commit();
	conn.setAutoCommit(true);
	conn.close();
	stmt.close();
	pstm.close();
%>

<script type="text/javascript">
function delayURL(url,time){
	setTimeout("top.location.href='"+url+"'", time);
}

</script>
</head>
<body>
<%=
	username +","+ email +","+ password
%>
<div align="center">
<h1>
<a style=" color:#E82C0C; font-size:22px;" href="index.html">注册成功，3秒钟后或点此回到登录页面。</a>
</h1>
</div> 
<script type="text/javascript">
	delayURL("index.html", 3000);
</script>
</body>
</html>