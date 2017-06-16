<%@page import="com.ysnc.shopping.product.ProductMgr"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page
	import="com.ysnc.shopping.DAO.*, java.util.*,com.ysnc.shopping.product.*,com.ysnc.shopping.*"%>
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
	String admin = (String) session.getAttribute("admin");
	String action = request.getParameter("action");
	if (admin == null || !admin.equals("true")) {
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
	List<Product> products = new ArrayList<Product>();
	int pageCount = ProductMgr.getInstance().getProducts(products, pageNo, PAGE_SIZE);
	int pageNext = pageNo+1;
	if (pageNo > pageCount-1)
		pageNext = pageCount;
	
	
	if(request.getParameter("pageinput")!=null){
		int pageinput = Integer.parseInt(request.getParameter("pageinput"));
		if(pageinput > pageCount){
			pageinput = pageCount;
		}
		response.sendRedirect("productlist.jsp?pageno="+pageinput);
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
						<th style="width: 5%">产品ID</th>
						<th style="width: 5%">类别ID</th>
						<th style="width: 10%">产品名称</th>
						<th style="width: 10%">产品描述</th>
						<th style="width: 15%">普通\会员价格</th>
						<th style="width: 20%">图片</th>
						<th style="width: 10%">加入时间</th>
						<th style="width: 20%">操作</th>
					</tr>
					<%
						for (Iterator<Product> it = products.iterator(); it.hasNext();) {
							Product p = it.next();
					%>
					<tr>
						<td><input type="checkbox"></td>
						<td><%=p.getId()%></td>
						<td><%=p.getC().getName()%></td>
						<td><%=p.getName()%></td>
						<td><span style="color: #6bc095"><%=p.getDescr()%></span></td>
						<td><%=p.getNormalprice()%>/<%=p.getMemberprice()%></td>
						<td><img class="thumb" src="../../imgs/products/<%=p.getId()%>.jpg" /></td>
						<td><%=p.getPdate()%></td>
						<td>
							<div class="table-fun">
								<a href="modiproduct.jsp?id=<%=p.getId()%>&pname=<%=p.getName()%>&pdescr=<%=p.getDescr() %>&cid=<%=p.getC().getId() %>&cname=<%=p.getC().getName()%>&pnormalprice=<%=p.getNormalprice()%>&pmemberprice=<%=p.getMemberprice()%>  ">修改</a> 
								<a href="upload.jsp?id=<%=p.getId()%>" target="info">上传</a>
							</div>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				<div class="page">
					<form action="" method="get">
						<a href="productlist.jsp?pageno=1">首页</a> <a
							href="productlist.jsp?pageno=<%=pageNo - 1%>">上一页</a> <a
							href="productlist.jsp?pageno=<%=pageNext%>">下一页</a> 第<span
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