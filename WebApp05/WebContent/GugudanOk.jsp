<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지(Gugudan.jsp) 로부터 데이터 수신 → dan
	
	String danStr = request.getParameter("dan");

	int n = 0;
	
	try
	{
		n = Integer.parseInt(danStr);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	// 내 풀이
	/* 
	// 데이터 수신
	String strdan = request.getParameter("dan");
	int dan = Integer.parseInt(strdan);
	String result = "확인 불가";
	
	try
	{
		result = "";
		
		for(int i=1; i<=9; i++)
		{
			result += String.valueOf(dan) + "*" + String.valueOf(i) + "=" + String.valueOf(dan*i) + "<br>";
		}
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
		getServletContext().log("오류 : " + e.toString());
	}
	*/	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GugudanOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp ○ → GugudanOk.jsp ●</p>
</div>

<!-- html 주석문 -->
<%-- jsp 주석문 --%>
<%-- jsp 주석문은 일꾼에게 안 보이도록 하는 것. 웹 페이지에서 안 보인다. --%>

<!-- 방법 1 -->
<%-- 
<%
for(int i=1; i<=9; i++)
{
	out.print(n + " * " + i + " = " + (n*i) + "<br>");
}
%>
--%>

<!-- 방법 2 -->
<%
	for(int i=1; i<=9; i++)
	{
%>
		<!-- html 영역 -->
		<%=n %> * <%=i %> = <%=(n*i) %> <br>
<%		
	}
%>

<!-- 내 풀이 -->
<%-- 
<div>
	<h2>결과</h2>
	<%=result %>
</div> 
--%>

</body>
</html>