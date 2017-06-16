<%@page import="java.util.List"%>
<%@page import="com.ysnc.shopping.salesitem.SalesItem"%>
<%@page import="com.ysnc.shopping.order.Order"%>
<%@page import="com.ysnc.shopping.order.OrderMgr"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<%
	int oId = Integer.parseInt(request.getParameter("oid"));
	Order o = OrderMgr.getInstance().loadById(oId);
	List<SalesItem> items = OrderMgr.getInstance().getSalesItem(o);
	System.out.println(items.size());
%>
</head>
<body>
<table class="public-cont-table" border="1">
					
					<tr>
						<td>订单信息：</td>
					</tr>
					<tr>
						<th style="width: 10%">订单ID</th>
						<th style="width: 5%">用户ID</th>
						<th style="width: 20%">订单地址</th>
						<th style="width: 20%">下单时间</th>
						<th style="width: 20%">处理情况</th>
						<th style="width: 25%">图片</th>
					</tr>
					<tr>
						<th style="width: 10%"><%=o.getId()%></th>
						<th style="width: 5%"><%=o.getUserId()%></th>
						<th style="width: 20%"><%=o.getAddr()%></th>
						<th style="width: 20%"><span style="color: #6bc095"><%=o.getOdate()%></span></th>
						<th style="width: 20%"><%=o.getStatus()%></th>
						<th style="width: 25%"><img class="thumb" src=" " /></th>
					</tr>
					
					<tr>
						<td>用户信息：</td>
					</tr>
					<tr>
						<th style="width: 10%">用户ID</th>
						<th style="width: 5%">用户名</th>
						<th style="width: 20%">用户密码</th>
						<th style="width: 20%">收货地址</th>
						<th style="width: 20%">创建时间</th>
						<th style="width: 25%">用户电话</th>
					</tr>
					<tr>
						<th style="width: 10%"><%=o.getNuser().getId()%></th>
						<th style="width: 5%"><%=o.getNuser().getUsername()%></th>
						<th style="width: 20%"><%=o.getNuser().getPassword()%></th>
						<th style="width: 20%"><%=o.getNuser().getAddr()%></th>
						<th style="width: 20%"><%=o.getNuser().getRdate()%></th>						
						<th style="width: 25%"><%=o.getNuser().getPhone()%></th>
					</tr>
		<%
		for(int i=0; i<items.size();i++){
			SalesItem si = items.get(i);
		%>
			<tr>
						<td>产品信息：</td>
					</tr>
					<tr>
						<th style="width: 10">所在分类</th>
						<th style="width: 5%">产品ID</th>
						<th style="width: 5%">产品名称</th>
						<th style="width: 20%">产品描述</th>
						<th style="width: 20%">产品购买单价</th>
						<th style="width: 10%">购买数量</th>
					
					</tr>
					<tr>
					<th style="width: 10%"><%=si.getP().getCid()%></th>
						<th style="width: 5%"><%=si.getP().getId()%></th>
						<th style="width: 5%"><%=si.getP().getName()%></th>
						<th style="width: 20%"><%=si.getP().getDescr()%></th>
						<th style="width: 20%"><%=si.getUnitPrice()%></th>
						<th style="width: 20%"><%=si.getCount()%></th>						
					</tr>
						
		<%
		}
		%>
					</table>
</body>
</html>