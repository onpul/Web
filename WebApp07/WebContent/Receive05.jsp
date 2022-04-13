<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 이전 페이지로(Send05.html)부터 넘어온 데이터 수신 → dan
	
	String dan = request.getParameter("dan");
	int nDan = 0;
	String result = "";
	
	try
	{
		nDan = Integer.parseInt(dan);
		
		for (int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", nDan, i, (nDan*i));
		}
	}
	catch(Exception e)
	{
		System.out.println("e.toString");
	}
%>

<%-- 
<%
	String danStr = request.getParameter("selectdan");
	int dan = Integer.parseInt(danStr);
	
	String result = "";
	
	result += dan + "단<br><br>";
	
	for (int i=1; i<=9; i++)
		result += dan + " * " + i + " = " + String.valueOf(i*dan) + "<br>";
%>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력</h2>
	<div>
		<%=result %>
	</div>
</div>

<div>
<%-- 
<!-- 스크립트 릿 영역에서 구성 후 값만 표현식에 넣기 -->
<%=result %>

<hr>

<!-- body 영역에서 구성해보기 -->
<%=dan %>단<br><br>
<%
for (int i=1; i<=9; i++) 
{
%>

	<%=dan %> * <%=i %> = <%=(dan * i) %><br>

<%
}
%>
--%>
</div>

</body>
</html>