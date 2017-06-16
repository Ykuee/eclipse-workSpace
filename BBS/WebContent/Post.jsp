<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Reply</title>
<link rel="stylesheet" type="text/css" href="imgs/style_2_common.css">
<link rel="stylesheet" type="text/css"
	href="imgs/style_2_forum_forumdisplay.css">
<link rel="stylesheet" id="css_widthauto" type="text/css"
	href="imgs/style_2_widthauto.css">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function() {
		CKEDITOR.replace('cont');
	};
</script>
<%
	request.setCharacterEncoding("gbk");

	String action = request.getParameter("action");
	if(action!=null && action.equals("post")){
		String title = request.getParameter("title");
		String cont = request.getParameter("cont");
		
		cont = cont.replaceAll("\n", "<br>");
	
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
		Connection conn = DriverManager.getConnection(url);
		
		conn.setAutoCommit(false);
	
		String sql = "insert into article values (null, 0, ?, ?, ?, now(), 0)";
		PreparedStatement pstm = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		Statement stmt = conn.createStatement();
		
		pstm.setInt(1,-1);
		pstm.setString(2, title);
		pstm.setString(3, cont);
		pstm.executeUpdate();
		ResultSet rsKey = pstm.getGeneratedKeys();
		rsKey.next();
		int key = rsKey.getInt(1);
		rsKey.close();
		stmt.executeUpdate("update article set rootid = "+key +" where id =" + key);
		conn.commit();
		conn.setAutoCommit(true);
	
		conn.close();
		stmt.close();
		pstm.close();
		
		response.sendRedirect("sgjz.jsp");
	}
%>

</head>
<body>
	<form  action="Post.jsp" Method="post">
		<input type="hidden" name="action" value="post">
		<table border="0">
			<tr>
				<td>标题：</td>
				<td><input type="text" name="title" size="80"></td>
			</tr>
			<tr>
				<td>回复：</td>
				<td><textarea cols="80" rows="12" name="cont"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="提交">
	</form>

</body>
</html>