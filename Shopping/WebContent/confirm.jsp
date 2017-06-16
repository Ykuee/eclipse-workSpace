<%@page import="com.ysnc.shopping.cart.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.ysnc.shopping.cart.Cart"%>
<%@page import="com.ysnc.shopping.nUser"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>订单详情</title>
</head>
<body>
	<%
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			out.println("<h1>购物车空空如野</h1>");
			return;
		}
		nUser u = (nUser) session.getAttribute("nuser");
		if (u == null) {
			out.println("<h3><a href='nuser/rejister.jsp'>免费注册并登录享会员价格哦！~ 点此注册</a></h3>");
			out.println("<h2><a href='nuser/login.jsp'>登录</a></h2>");
	%>
		<li>请填写收货相关信息</li>
	<from action="order.jsp" method="post">
	<table align="center">
		<tr>
		<td>
			&nbsp&nbsp&nbsp收货人
		</td>
		<td>
			<input type="text" name="username" />
		</td>
		</tr>
		<tr>
			<td align=right style="padding-right: 5px; color: #000;">手机号码<br>
				<span style="color: #808080; font-size: 8pt;">11位正确的号码</span></td>
			<td align=left style="padding: 5px; color: #000;"><input
				name="phone" id="f5" type=text maxlength=11 size=21
				jval="{valid:function (val) { if (val.length != 11) return false; else return true; }, message:'手机号码输入不正确', styleType:'cover'}"
				jvalkey="{valid:/[0-9]/, message:'&quot;%c&quot; Invalid Character - Only Digits Allowed', cFunc:'$(\'#formContainer\').jVal()'}"></td>
		</tr>
		<tr>
			<td align=right style="padding-right: 5px; color: #000;">收货地址</td>
			<td align=left style="padding: 5px; color: #000;"><textarea
					id="f1" rows="5" cols="30" name="addr"></textarea></td>
		</tr>
	
	</table>
	
	<%
		} else {
			out.println("<h2>欢迎您！~" + u.getUsername() + "感谢您的购买</h2>");
	%>


	<li>请确认信息是否正确</li>
	<form action="order.jsp" method="post">
	<table align="center" border=1 style="color: red; font-size: 24px">
		<tr>
			<td>用户名</td>
			<td><%=u.getUsername()%></td>
		</tr>
		<tr>
			<td>收货地址</td>
			<td><%=u.getAddr()%></td>
		</tr>
		<tr>
			<td>用户电话</td>
			<td><%=u.getPhone()%></td>
		</tr>
		<tr>
			<td><a href="nuser/index.html">点此修改用户信息</a></td>
		</tr>
	</table>
	<br>
	<br>
	<%
		}
	%>
	<table align="center" border=1 style="color: blue; font-size: 24px">
		<tr>
			<td>商品ID</td>
			<td>商品名称</td>
			<td>商品价格<%=(u == null ? "(市场价)" : "(会员价)")%></td>
			<td>购买数量</td>
			<td>商品总价格</td>
		</tr>
		<%
			List<CartItem> items = cart.getCart();
			for (int i = 0; i < items.size(); i++) {
				CartItem ci = items.get(i);
		%>
		<tr>
			<td><%=ci.getProductId()%></td>
			<td><%=ci.getProductName()%></td>
			<td><%=(u == null ? ci.getProductPrice() : ci.getProductMprice())%></td>
			<td><%=ci.getCount()%></td>
			<td><%=(u == null) ? ci.getTotalPrice() : ci.getProductMprice() * ci.getCount()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<br>
	<table align="center" border=1 style="color: blue; font-size: 24px">
		<tr align="left">
			<td>购物车商品总价格</td>
			<td><%=(u == null ? cart.getTotalPrice() : cart.getMTotalPrice())%>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<center>
		<input type="submit" value="确认下单" />
	</center>

	</from>
</body>
</html>