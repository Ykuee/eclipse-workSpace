<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@ page import="com.ysnc.shopping.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<%
int id = Integer.parseInt(request.getParameter("id"));
boolean delete = CategoryDAO.getInstance().delete(id);
if(delete == true){
	out.println("删除成功");
}else{
	out.println("失败呐呐呐！！！");
}
%>
</head>
<body>

</body>
</html>