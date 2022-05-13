<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	StringBuffer sb = new StringBuffer();
	
	for(int i=1; i<=5; i++)
	{
		sb.append("{\"num\":\"" + i + "\""); 					// {"num":"1"
		sb.append(", \"name\":\"" + name + i +"\"");			// , "name":"임소민1"
		sb.append(", \"content\":\"" + content + i + "\"}");	// , "content":"안녕하세요1"}
	}
	
	result = sb.toString();
	
	out.println(result);
%>
