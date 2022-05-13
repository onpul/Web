<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%><%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// AjaxTest03_ok.jsp
	
	response.setContentType("text/xml");
	
	// xml 도큐먼트에서 최상의 엘리먼트는 단 하나
%><?xml version="1.0" encoding="UTF-8"?>
<root>
	<status>true</status>
	<records id="1">
		<title>${param.title }</title>
		<content>${param.content }</content>
	</records>
	<records id="2">
		<title>${param.title }</title>
		<content>${param.content }</content>
	</records>
</root>
<%-- 
<lists>
	<%
	for (int i=1; i<=2; i++)
	{
	%>
	<comment num="<%=i %>">
		<title><%=title %></title>
		<content><%=content %></content>
	</comment>
	<%
	}
	%>
</lists> 
--%>