<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.ysnc.shopping.sUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户注册</title>
<script language="JavaScript" type="text/javascript"
	src="images/jquery.js"></script>
<script language="JavaScript" type="text/javascript"
	src="images/jquery.corner.js"></script>
<script language="JavaScript" type="text/javascript" src="images/jVal.js"></script>
<link rel="stylesheet" type="text/css" href="images/jVal.css">
<style>
BODY {
	font-size: 9pt;
}

body, td, th {
	font-size: 16pt;
}
</style>

<%
	request.setCharacterEncoding("GBK");
	String action = request.getParameter("action");
	if (action != null && action.equals("rejister")) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		sUser u = new sUser();
		u.setAddr(addr);
		u.setPassword(password);
		u.setPhone(phone);
		u.setUsername(username);
		u.setRdate(new Date(System.currentTimeMillis()));
		u.save();
%>
<center>
	<h1>注册成功！</h1>
	
</center>
<%
	}
%>

</head>
<body>

	<div id="formbackground" style="position: absolute; z-index: -1;">
		<img src="images/bg.png" height="100%" width="100%" />
	</div>
	<!-- 
<script type="text/javascript">
$(function(){
    $('#formbackground').height($(window).height());
    $('#formbackground').width($(window).width());
});

</script>
 -->

	<div>
		<form name="form" action"rejister.jsp" method="post">
			<input type="hidden" name="action" value="rejister" />
	</div>
	<table height="611" border=0 id="formContainer1" style="padding: 10px;">
		<tr>
			<td width="161" align=right style="padding-right: 5px; color: #000;">账号</td>
			<td width="625" align=left style="padding: 5px; color: #000;"><input
				name="username" id="f1" type=text size=20
				jval="{valid:function (val) {
           if (val.length < 3 || val.length > 12) return false; else return true;
            },
             message:'账户名必须大于3位小于12位', styleType:'cover'}"></td>
		</tr>
		<tr>
			<td align=right style="padding-right: 5px; color: #000;">密码</td>
			<td align=left style="padding: 5px; color: #000;"><input
				name="password" id="password" type=password
				jval="{valid:function (val) { if (val.length < 4) return false; else return true; }, message:'密码长度必读大于4', styleType:'pod'}"></td>
		</tr>
		<tr>
			<td align=right style="padding-right: 5px; color: #000;">再次输入密码</td>
			<td align=left style="padding: 5px; color: #000;"><input
				id="passwordVerify" type=password
				jval="{valid:function (val) { if ( val != eval('$(\'#password\').val()') ) return false; else return true; }, message:'两次密码输入不一致', styleType:'pod'}"></td>
		</tr>


		<tr class="center">
			<td></td>
			<td style="padding: 5px;"><input type=button
				onClick="if ( $('#formContainer1').jVal() ) document.form.submit();"
				value="提交"></td>
		</tr>
	</table>
	</form>
</body>
</html>