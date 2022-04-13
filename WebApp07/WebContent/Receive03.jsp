<%@ page contentType="text/html; charset=UTF-8"%>
<%

	//Send03.html 페이지로부터 데이터 수신
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	String result = "";
	
	int num1 = 0;
	int num2 = 0;
	
	try
	{
		
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(op.equals("+"))
		{
			result = String.valueOf(num1 + num2);
		}
		else if(op.equals("-"))
		{
			result = String.valueOf(num1 - num2);
		}
		else if(op.equals("*"))
		{
			result = String.valueOf(num1 * num2);
		}
		else if(op.equals("+"))
		{
			//result = String.valueOf(num1 /num2);
			//result = String.valueOf(num1 / (double)num2);
			result = String.format("%.1f",(num1 / (double)num2));
		}
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
		
	}
	

// 내 풀이
/* 
	request.setCharacterEncoding("UTF-8");

	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	
	String selStr = request.getParameter("sel");
	
	int su1=0;
	int su2=0;
	int sel=0;
	
	try
	{
		su1 = Integer.parseInt(su1Str);
		su2 = Integer.parseInt(su2Str);
		sel = Integer.parseInt(selStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
		getServletContext().log("오류 : " + e.toString());
	}
	
	int result = 0;
	
	switch(sel)
	{
		case 1 : result = su1 + su2; break;  
		case 2 : result = su1 - su2; break;
		case 3 : result = su1 * su2; break;
		case 4 : result = su1 / su2; break;
	} 
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	입력하신 <%=num1 %>와(과) <%=num2 %>의 연산 결과는 <%=result %>입니다.
</div>

<%-- 
<div>
	입력하신 <%=su1 %>와(과) <%=su2 %>의 연산 결과는 <%=result %>입니다.
</div>
--%>
</body>
</html>