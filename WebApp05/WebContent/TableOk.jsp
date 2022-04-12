<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로부터 전송된 데이터 수신
	
	request.setCharacterEncoding("UTF-8");
	// 한글 깨짐 방지 위해 하는 거지만 리소스 낭비되지 않으니까 해 놓는 것이 좋다.
	
	// 데이터 수신
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	int n1 = 0;
	int n2 = 0;
	
	// 테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int n = 0;
	
	try
	{
		// 수신된 데이터 형 변환
		n1 = Integer.parseInt(s1);
		n2 = Integer.parseInt(s2);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	

	// 내 풀이
	/* 
	// 데이터 수신
	
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");

	int su1 = 0;
	int su2 = 0;
	
	try
	{
		su1 = Integer.parseInt(su1Str);
		su2 = Integer.parseInt(su2Str);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	// 행 먼저 만들고 그 안에 열
	String result = "";
	
	for (int i=0; i<su2; i++)
	{
		result += "<tr>";
		for (int j=0; j<su1; j++)
		{
			result += "<td></td>";
		}
		result += "</tr>";		
	} 
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TableOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp ○ → TableOk.jsp ●</p>
</div>

<div>
	<table border="1">
		<%
		for(int i=0; i<n2; i++)
		{
		%>
			<tr>
			<%
			for(int j=0; j<n1; j++)
			{
			%>
				<td style="width: 40px; text-align:right;"><%=++n %></td>
			<%
			}
			%>
			</tr>
		<%
		}
		%>
	</table>
</div>

<!-- 내 풀이 -->
<%-- 
<div>
	<table border="1" style="width:400px; height:100px;">
		<%=result%>
	</table>
</div>
--%>

</body>
</html>