<%@page import="com.ysnc.shopping.order.OrderMgr"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.ysnc.shopping.order.Order"%>
<%@page import="com.ysnc.shopping.cart.Cart"%>
<%@page import="com.ysnc.shopping.nUser"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
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
			String addr = request.getParameter("addr");
			String phone = request.getParameter("phone");
			String username = request.getParameter("username");
			u = new nUser();
			u.setAddr(addr);
			u.setUsername(username);
			u.setId(-1);
		}
	%>
	
	<%	
		Order o = new Order();
		o.setNuser(u);
		o.setUserId(u.getId());
		o.setCart(cart);
		o.setAddr(u.getAddr());
		o.setOdate(new Timestamp(System.currentTimeMillis()));
		o.setStatus(0);
		System.out.println(o.getAddr());
		OrderMgr.getInstance().save(o);
		session.removeAttribute("cart");
	%>
</head>
<body>
	<center>
	<h1><a href="nuser/index.html">感谢购物！三秒后或点此查看订单。</a></h1>
	</center>
	<script type="text/javascript">
		function go() {
			document.location.href = "nuser/index.html";
		}
		setTimeout(go,3000);
	</script>
</body>
</html>