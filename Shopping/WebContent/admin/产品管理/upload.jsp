 <%@ page language="java" pageEncoding="UTF-8"%>  
<%@ page import="java.util.*" %>  
<html>  
  <head>  
    <title>文件上传测试</title>
    <%
    
    int id = Integer.parseInt(request.getParameter("id"));
    
    %>  
  </head>  
  <body>  
   
    <form method="post" action="<%=request.getContextPath() %>/FileUpload" enctype="multipart/form-data" >  
            <input type="hidden" name="id" value="<%=id %>" />
            <p><input type="file" name="myfile1" value="浏览文件" /></p>  
            <p><input type="submit" value="上传"/></p>  
    </form>  
  </body>  
</html> 