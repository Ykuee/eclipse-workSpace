<%
	response.setContentType("text/xml");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.getWriter().write("<msg>NononO</msg>");
%>
