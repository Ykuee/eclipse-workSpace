<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"
	import="com.ysnc.shopping.sUser, com.ysnc.shopping.nUser"
	import="com.ysnc.util.DB"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="GBK">
<title>后台欢迎页</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/content.css" />
<%
	String admin = (String) session.getAttribute("admin");
	if (admin == null || !admin.equals("true")) {
		out.println("请登录再试");
		return;
	}
%>

<%
	List<sUser> susers = sUser.getUsers();
	List<nUser> nusers = nUser.getUsers();
%>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">
			您当前的位置：<a href="">管理首页</a>><a href="">用户管理</a>
		</div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>修改用户配置</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width: 10%">编号</th>
						<th style="width: 10%">用户名</th>
						<th style="width: 10%">用户密码</th>
						<th style="width: 15%">用户电话</th>
						<th style="width: 20%">用户地址</th>
						<th style="width: 20%">创建日期</th>
						<th style="width: 20%">操作</th>
					</tr>

					<%
						for (Iterator<sUser> it = susers.iterator(); it.hasNext();) {
							sUser u = it.next();
					%>
					<tr>
						<td><%=u.getId()%></td>
						<td><%=u.getUsername()%></td>
						<td><%=u.getPassword()%></td>
						<td><%=u.getPhone()%></td>
						<td><%=u.getAddr()%></td>
						<td><%=u.getRdate()%></td>
						<td>
							<div class="table-fun">
								<a href="suserupdate.jsp?id=<%=u.getId()%>&username=<%=u.getUsername()%>&password=<%=u.getPassword()%>&phone=<%=u.getPhone()%>&addr=<%=u.getAddr()%>&rdate=<%=u.getRdate()%>">修改</a> 
								 <a href="suserdel.jsp?id=<%=u.getId()%>" target="info">删除</a>
							</div>
						</td>
					</tr>
					<%
						}
					%>
					<td>普通会员:</td>
					<%
						for (Iterator<nUser> it = nusers.iterator(); it.hasNext();) {
							nUser u = it.next();
					%>

					<tr>
						<td><%=u.getId()%></td>
						<td><%=u.getUsername()%></td>
						<td><%=u.getPassword()%></td>
						<td><%=u.getPhone()%></td>
						<td><%=u.getAddr()%></td>
						<td><%=u.getRdate()%></td>
						<td>
							<div class="table-fun">
								<a href="nuserupdate.jsp?id=<%=u.getId()%>&username=<%=u.getUsername()%>&password=<%=u.getPassword()%>&phone=<%=u.getPhone()%>&addr=<%=u.getAddr()%>&rdate=<%=u.getRdate()%>">修改</a> <a href="nuserdel.jsp?id=<%=u.getId()%>"
									target="info">删除</a>
							</div>
						</td>
					</tr>
					<%
						}
					%>

				</table>
				<div class="page">
					<form action="" method="get">
						共<span>42</span>个站点 <a href="">首页</a> <a href="">上一页</a> <a
							href="">下一页</a> 第<span style="color: red; font-weight: 600">12</span>页
						共<span style="color: red; font-weight: 600">120</span>页 <input
							type="text" class="page-input"> <input type="submit"
							class="page-btn" value="跳转">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>