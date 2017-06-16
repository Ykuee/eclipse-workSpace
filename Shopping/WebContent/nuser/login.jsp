<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.ysnc.shopping.nUser"%>
<!doctype html>
<html lang="en-US">
<head>

<meta charset="GBK">

<title>Login</title>

<link rel="stylesheet" href="images/stylesheet.css">
<%
	String login = request.getParameter("action");
	String str = "用戶名";
	if(login !=null&&login.equals("login")){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		nUser u = new nUser();
		if(nUser.loginIn(username, password,u)){
			session.setAttribute("nuser",u);
			response.sendRedirect("../index.jsp");
		}
		str="用户名或密码不正确，请重新输入";
	}
%>


</head>

<body>

	<div id="login">

		<h2>
			<span class="fontawesome-lock"></span>登录
		</h2>

		<form action="login.jsp" method="POST">
		
		<input type="hidden" name="action" value="login" />
			<fieldset>

				<p>
					<label for="username"><%=str %></label>
				</p>
				<p>
					<input type="username" name="username" id="username" value="UserName"
						onBlur="if(this.value=='')this.value='UserName'"
						onFocus="if(this.value=='UserName')this.value=''">
				</p>

				<p>
					<label for="password">Password</label>
				</p>
				<p>
					<input type="password" id="password" name="password" value="password"
						onBlur="if(this.value=='')this.value='password'"
						onFocus="if(this.value=='password')this.value=''">
				</p>

				<p>
					<input type="submit" value="GO">
				</p>

			</fieldset>

		</form>

	</div>
	<!-- end login -->

</body>
</html>