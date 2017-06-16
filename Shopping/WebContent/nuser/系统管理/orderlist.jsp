<%@page import="com.ysnc.shopping.order.OrderMgr"%>
<%@page import="com.ysnc.shopping.order.Order"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page
	import="com.ysnc.shopping.DAO.*, java.util.*,com.ysnc.shopping.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="GBK">
<title>后台欢迎页</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/content.css" />
<%!private static final int PAGE_SIZE = 3;%>

<%	
	request.setCharacterEncoding("GBK");
	nUser nuser = (nUser) session.getAttribute("nuser");
	String action = request.getParameter("action");
	if (nuser == null ){
		out.println("请登录再试");
		return;
	}

	String strPageNo = request.getParameter("pageno");
	int pageNo = 1;
	if (strPageNo != null) {
		pageNo = Integer.parseInt(strPageNo);
	}
	if (pageNo < 1) {
		pageNo = 1;
	}
	int id = nuser.getId();
	int pageSize = 3;
	List<Order> orders = new ArrayList<Order>();
	int pageCount = OrderMgr.getInstance().getOrdersBynUserid(orders, pageNo, pageSize, id);
	int pageNext = pageNo+1;
	if (pageNo > pageCount-1)
		pageNext = pageCount;
	
	
	if(request.getParameter("pageinput")!=null){
		int pageinput = Integer.parseInt(request.getParameter("pageinput"));
		if(pageinput > pageCount){
			pageinput = pageCount;
		}
		response.sendRedirect("orderlist.jsp?pageno="+pageinput);
	}
%>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">
			您当前的位置：<a href="">管理首页</a>><a href="">产品管理</a><a href="">所有信息</a>
		</div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>产品列表</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width: 5%">选择</th>
						<th style="width: 5%">订单ID</th>
						<th style="width: 5%">用户ID</th>
						<th style="width: 10%">订单地址</th>
						<th style="width: 10%">下单时间</th>
						<th style="width: 15%">用户电话</th>
						<th style="width: 20%">图片</th>
						<th style="width: 20%">操作</th>
					</tr>
					<%
						for (Iterator<Order> it = orders.iterator(); it.hasNext();) {
							Order o = it.next();
					%>
					<tr>
						<td><input type="checkbox"></td>
						<td><%=o.getId()%></td>
						<td><%=o.getUserId()%></td>
						<td><%=o.getAddr()%></td>
						<td><span style="color: #6bc095"><%=o.getOdate()%></span></td>
						<td><%=o.getNuser().getUsername()%></td>
						<td><img class="thumb" src="../images/thumb.jpg" /></td>
						<td>
							<div class="table-fun">
								<a href="modiorder.jsp ">修改</a> <a href="orderdetailshow.jsp?oid=<%=o.getId() %>" target="info">详细</a>
							</div>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				<div class="page">
				
					<form action="" method="get">
						<a href="orderlist.jsp?pageno=1">首页</a> <a
							href="orderlist.jsp?pageno=<%=pageNo - 1%>">上一页</a> <a
							href="orderlist.jsp?pageno=<%=pageNext%>">下一页</a> 第<span
							style="color: red; font-weight: 600"><%=pageNo%></span>页 共<span
							style="color: red; font-weight: 600"><%=pageCount%></span>页 <input
							type="text" class="page-input" name="pageinput"> <input
							type="submit" class="page-btn" value="跳转">
					</form>
			
				</div>
			</div>
		</div>
	</div>
</body>
</html>