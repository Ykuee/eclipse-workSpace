<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.ysnc.shopping.nUser"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="GBK">
<title>后台欢迎页</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/content.css" />
<%
	nUser u = (nUser) session.getAttribute("nuser");
	if (u == null) {
		out.println("请登录在试");
		return;
	}
%>
<%	String str = "";
	String action = request.getParameter("action");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	if (action != null && action.equals("post")) {
		u.setAddr(addr);
		u.setUsername(username);
		u.setPassword(password);
		u.setPhone(phone);
		u.userUpdate(u);
		str="修改成功";
	}
%>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">
			您当前的位置：<a href="">管理首页</a>>
		</div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>修改用户信息</h3>
			</div>
			<div class="public-content-cont">
				<form action="config.jsp" method="post" >
					<input type="hidden" name="action" value="post" />
					<font color="red">
					<%=str%>
					</font>
					<div class="form-group">
						<label for="">用户名</label> <input class="form-input-txt"
							type="text" name="username" value="<%=u.getUsername()%>" />
					</div>
					<div class="form-group">
						<label for="">用户密码</label> <input class="form-input-txt"
							type="text" name="password" value="<%=u.getPassword()%>" />
					</div>
					<div class="form-group">
						<label for="">用户电话</label> <input class="form-input-txt"
							type="text" name="phone" value="<%=u.getPhone()%>" />
					</div>
					<div class="clearfix"></div>
					<div class="form-group">
						<label for="">收货地址</label>
						<textarea class="form-input-textara" type="text"
							name="addr"><%=u.getAddr()%></textarea>
					</div>

					<div class="form-group" style="margin-left: 150px;">
						<input type="submit" class="sub-btn" value="提  交" /> <input
							type="reset" class="sub-btn" value="重  置" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="../kingediter/kindeditor-all-min.js"></script>

</body>
</html>