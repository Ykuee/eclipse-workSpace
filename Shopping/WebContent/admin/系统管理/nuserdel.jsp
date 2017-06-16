<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="com.ysnc.shopping.*"%>
<%@ page import="com.ysnc.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>删除用户</title>
</head>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	nUser.deleUser(id);
%>
<body>
删除成功！
<script type="text/javascript">
<!--
window.parent.content.document.location.reload();
	-->
</script>
</body>
</html>