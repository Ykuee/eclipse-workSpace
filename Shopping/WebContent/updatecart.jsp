<%@page import="java.util.List"%>
<%@page import="com.ysnc.shopping.cart.CartItem"%>
<%@page import="com.ysnc.shopping.cart.Cart"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<%
Cart cart = (Cart)session.getAttribute("cart");
if(cart == null){
	 cart = new Cart();
	 session.setAttribute("cart", cart);
		out.println("<h1>购物车空空如野</h1>");
		return;
}

List<CartItem> items = cart.getCart(); 
for(int i =0 ;i<items.size(); i++){
	CartItem ci = items.get(i);
	String strCount = request.getParameter("p"+ci.getProductId());
	if(strCount != null ||strCount.trim().equals("")){
		ci.setCount(Integer.parseInt(strCount));
	}
}
%>
</head>
<body>
	<center>
	<h1><a href="mycart.jsp">修改成功！三秒后或点此返回页面。</a></h1>
	</center>
	<script type="text/javascript">
		function go() {
			document.location.href = "mycart.jsp";
		}
		setTimeout(go,3000);
	</script>
</body>
</html>