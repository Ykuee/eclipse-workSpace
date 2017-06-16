<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="imgs/style_2_common.css">
<link rel="stylesheet" type="text/css"
	href="imgs/style_2_forum_forumdisplay.css">
<link rel="stylesheet" id="css_widthauto" type="text/css"
	href="imgs/style_2_widthauto.css">
<%
	request.setCharacterEncoding("gbk");
	int id = Integer.parseInt(request.getParameter("id"));
	int rootid = Integer.parseInt(request.getParameter("rootid"));
	String title = request.getParameter("title");
	String cont = request.getParameter("cont");
	cont = cont.replaceAll("\n", "<br>");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
	Connection conn = DriverManager.getConnection(url);
	conn.setAutoCommit(false);

	String sql = "insert into article values (null, ?, ?, ?, ?, now(), 0)";
	PreparedStatement pstm = conn.prepareStatement(sql);
	Statement stmt = conn.createStatement();

	pstm.setInt(1, id);
	pstm.setInt(2, rootid);
	pstm.setString(3, title);
	pstm.setString(4, cont);
	pstm.executeUpdate();

	stmt.executeUpdate("update article set isleaf = 1 where id =" + id);
	conn.commit();
	conn.setAutoCommit(true);

	conn.close();
	stmt.close();
	pstm.close();
%>
<title>ReplyOk</title>
</head>
<body>
<script type="text/javascript">
function delayURL(url,time){
	setTimeout("top.location.href='"+url+"'", time);
}

</script>
<div align="center">
<h1>
<a style=" color:#E82C0C; font-size:22px;" href="sgjz.jsp">回复成功，3秒钟后回到标题，或点此回到标题。</a>
</h1>
</div> 
<script type="text/javascript">
	delayURL("sgjz.jsp", 3000);
</script>
</body>
</html>