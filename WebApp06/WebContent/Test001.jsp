<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true" %> --%>
<%-- <%@ page buffer="1kb" autoFlush="false"%> 일 경우 에러 발생 --%>
<%-- <%@ page buffer="10kb" autoFlush="false"%> 일 경우 정상 처리 --%>
<%@ page buffer="1kb" autoFlush="true"%> 
<%-- 다시 리필할 수 있게 해 준 것. (autoFlush) --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
</div>

<div>
	<h2>반복문 구성</h2>
	
	<%
	for(int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>	
</div>

</body>
</html>