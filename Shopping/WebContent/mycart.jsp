<%@page import="com.ysnc.shopping.product.ProductMgr"%>
<%@page import="com.ysnc.shopping.nUser"%>
<%@page import="com.ysnc.shopping.cart.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.ysnc.shopping.cart.Cart"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>购物车</title>
<%
nUser u = (nUser)session.getAttribute("nuser");
if(u == null){
	out.println("<h2><a href='nuser/rejister.jsp'>免费注册并登录享会员价格哦！~ 点此注册</a></h2>");
	out.println("<h2><a href='nuser/login.jsp'>登录</a></h2>");
}else{
	out.println("<h2>欢迎您！~"+u.getUsername()+"感谢您的购买</h2>");
}
Cart cart = (Cart)session.getAttribute("cart");
if(cart == null){
	 cart = new Cart();
	 session.setAttribute("cart", cart);
		out.println("<h1>购物车空空如野</h1>");
		return;
}

%>
</head>
<body>
	<form action="updatecart.jsp" method="post">
	<table align="center" border = 1 style="color: blue; font-size: 24px">
		<tr>
			<td>商品ID</td>
			<td>商品名称</td>		
			<td>商品价格<%=(u == null? "(市场价)":"(会员价)") %></td>
			<td>购买数量</td>
			<td>商品总价格</td>
		</tr>
<%
	List<CartItem> items = cart.getCart(); 
	for(int i =0 ;i<items.size(); i++){
		CartItem ci = items.get(i);
%>
		<tr>
			<td><%=ci.getProductId()%></td>
			<td><%=ci.getProductName() %></td>
			<td><%=(u == null? ci.getProductPrice() : ci.getProductMprice()) %></td>
			<td><input type="text" name="<%="p"+ci.getProductId() %>" size="4" value="<%=ci.getCount()%>"/></td>
			<td><%=(u == null)? ci.getTotalPrice() : ci.getProductMprice()*ci.getCount() %></td>
		</tr>
<%
	}
%>
		</table>
		<table align="center" border = 1 style="color: blue; font-size: 24px">
		<tr align="left">
			<td>
				购物车商品总价格			
			</td>
			<td>
				<%=( u== null ? cart.getTotalPrice() : cart.getMTotalPrice())%>
			</td>
		</tr>
	</table>
	<center>
	<input type="submit" value="修改数量"/>
	<input type="button" value="立刻下单" onclick="document.location.href='confirm.jsp'" /> 
	</center>
	</form>
</body>
</html>