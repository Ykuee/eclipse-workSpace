<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
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
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int rootid = Integer.parseInt(request.getParameter("rootid"));
	String title = request.getParameter("title");
%>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function() {
		CKEDITOR.replace('cont');
	};
</script>

</head>
<body>
	<form name=Reply action="ReplyOk.jsp" Method="get">
		<input type="hidden" name="id" value="<%=id%>"> 
		<input type="hidden" name="rootid" value="<%=rootid%>">
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