<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.ysnc.shopping.nUser" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<%	
	request.setCharacterEncoding("GBK");
	String admin = (String) session.getAttribute("admin");
	String action = request.getParameter("action");
	
	if (admin == null || !admin.equals("true")) {
		out.println("请登录再试");
		return;
	}
	if(action !=null && action.trim().equals("post")){
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String addr = request.getParameter("addr");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String rdate = request.getParameter("rdate");
		nUser nu = new nUser();
		nu.setAddr(addr);
		nu.setId(id);
		nu.setPassword(password);
		nu.setPhone(phone);
		nu.setUsername(username);
		nu.setRdate(new Timestamp(System.currentTimeMillis()));
		nu.userUpdate(nu);
		out.print("OK");
		return;
	}
		
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String addr = request.getParameter("addr");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
%>
				<form action="nuserupdate.jsp" method="post">
				<table>
					<input type="hidden" name="action" value="post" />
					<input type="hidden" name="id" value="<%=id %>" />
					<tr>
					<td>
						<label for="">username</label> 
					</td>
					<td>
						<input class="form-input-txt" type="text" name="username" value="<%=username %>" />
					</td>
					</tr>	
					<tr>
					<td>
						<label for="">password</label>
					</td>
					<td>
						 <input class="form-input-txt" type="text" name="password" value="<%=password %>" />
					</td>
					</tr>
					<tr>
					<td>
						<label for="">phone</label> 
					</td>
					<td>
						<input class="form-input-txt" type="text" name="phone" value="<%=phone %>" />
					</td>
					</tr>
					<tr>
					<td>
						<label for="">addr</label>
					</td>
					<td>
						<textarea id="editor_id" name="addr" class="form-input-textara"
							style="width: 300px; height: 100px;" value=""><%=addr %></textarea>
					</td>
					</tr>
					</table>
					<input type="submit" class="sub-btn" value="提  交" /> 
				</form>
			</div>
</head>
<body>

</body>
</html>