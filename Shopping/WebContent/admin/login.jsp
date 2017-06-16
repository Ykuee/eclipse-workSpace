<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.ysnc.shopping.sUser"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="GBK" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/login.css" />
<%
	String login = request.getParameter("action");
	String str = "";
	if(login !=null&&login.equals("login")){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(sUser.loginIn(username, password)){
			session.setAttribute("admin","true");
			response.sendRedirect("index.jsp?username="+username);
		}
		str="用户名或密码不正确，请重新输入";
	}
%>	

</head>
<body>
<div class="page">
	<div class="loginwarrp">
		<div class="logo">管理员登陆</div>
        <div class="login_form">
			<form id="Login" name="Login" method="post" onsubmit="" action="">
			<input type="hidden" name="action" value="login" />
				<%=str %>
				<li class="login-item">
				
					<input type="text" value="用户名:" name="username" class="login_input"
											onBlur="if(this.value=='')this.value='用户名:'"
						onFocus="if(this.value=='用户名:')this.value=''">
				</li>
				<li class="login-item">
					<input type="password" name="password" value="password" class="login_input"
					onBlur="if(this.value=='')this.value='password'"
						onFocus="if(this.value=='password')this.value=''">
				</li>
				<div class="clearfix"></div>
				<li class="login-sub">
					<input type="submit" name="Submit" value="登录" />
				</li>                      
           </form>
		</div>
	</div>
</div>
</body>
</html>