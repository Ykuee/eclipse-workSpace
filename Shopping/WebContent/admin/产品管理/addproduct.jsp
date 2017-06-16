<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK" import="com.ysnc.shopping.product.*,com.ysnc.shopping.*,java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="GBK">
<title>后台欢迎页</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/public.css" />
<link rel="stylesheet" href="../css/content.css" />
<%
	request.setCharacterEncoding("GBK");
	String admin = (String) session.getAttribute("admin");
	String action = request.getParameter("action");
	String strcategoryid = request.getParameter("categoryid");
	int scategoryid = 0;
	if(strcategoryid !=null && !strcategoryid.equals("")){
		scategoryid = Integer.parseInt(strcategoryid);
	}
	
	if (admin == null || !admin.equals("true")) {
		out.println("请登录再试");
		return;
	}
	if(action !=null && action.trim().equals("post")){
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
		double normalprice = Double.parseDouble(request.getParameter("normalprice"));
		double memberprice = Double.parseDouble(request.getParameter("memberprice"));
		int categoryid = Integer.parseInt(request.getParameter("categoryid"));
		Product p = new Product();
		p.setName(name);
		p.setDescr(descr);
		p.setNormalprice(normalprice);
		p.setMemberprice(memberprice);
		p.setCid(categoryid);
		p.setPdate(new Timestamp(System.currentTimeMillis()));
		ProductMgr.getInstance().saveProduct(p);
		out.println("产品添加成功!恭喜!");
		return;
		
	}
%>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">
			您当前的位置：<a href="">产品管理</a>>
		</div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>添加产品</h3>
			</div>
			<div class="public-content-cont">
				<form action="addproduct.jsp" method="post">
					<input type="hidden" name="action" value="post" />
					<div class="form-group">
						<label for="">产品名称</label> <input class="form-input-txt"
							type="text" name="name" value="" />
					</div>
										<div class="form-group">
						<label for="">普通价格</label> <input class="form-input-txt"
							type="text" name="normalprice" value="" />
					</div>
										<div class="form-group">
						<label for="">会员价格</label> <input class="form-input-txt"
							type="text" name="memberprice" value="" />
					</div>
										<div class="form-group">
						<label for="">类别ID</label> <input class="form-input-txt"
							type="text" name="categoryid" value="" />
					
					<select name="categoryid">
				<%	List<Category> categories = CategoryDAO.getInstance().getCategories();
								System.out.println(categories.size());
					for (int i = 0; i < categories.size(); i++) {
						Category c = categories.get(i);
						if(c.getGrade()<=3){
					
				%>
				<option value="<%=c.getId()%>" <%=c.getId() == scategoryid ? "selected" : "" %>>id:<%=c.getId()%> name:<%=c.getName()%></option>
				<%
				}
					}
				%>
				</div>
			</select>
					<div class="form-group">
						<label for="">产品描述</label>
						<textarea id="editor_id" name="descr" class="form-input-textara"
							style="width: 700px; height: 300px;"></textarea>
					</div>
					<div class="form-group"></div>
					<div class="form-group" style="margin-left: 150px;">
						<input type="submit" class="sub-btn" value="提  交" /> 
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="../kingediter/kindeditor-all-min.js"></script>
	<script src="../js/laydate.js"></script>
	<script>
		KindEditor.ready(function(K) {
			window.editor = K.create('#editor_id');
		});
	</script>
</body>
</html>