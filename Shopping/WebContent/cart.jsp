<%@page import="com.ysnc.shopping.cart.Cart"%>
<%@page import="com.ysnc.shopping.product.Product"%>
<%@page import="com.ysnc.shopping.product.ProductMgr"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ysnc.shopping.cart.CartItem"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>购物车</title>
<%	
	request.setCharacterEncoding("GBK");
	Cart cart = (Cart)session.getAttribute("cart");
	if(cart == null){
		 cart = new Cart();
		 session.setAttribute("cart", cart);
}
	
	CartItem ci = new CartItem();
	int id = Integer.parseInt(request.getParameter("id"));
	Product p = ProductMgr.getInstance().loadById(id);
	ci.setCount(1);
	ci.setProductId(id);
	ci.setProductMprice(p.getMemberprice());
	ci.setProductName(p.getName());
	ci.setProductPrice(p.getNormalprice());
	cart.addItem(ci);
	response.sendRedirect("mycart.jsp");
%>

</head>
<body>
	
</body>
</html>