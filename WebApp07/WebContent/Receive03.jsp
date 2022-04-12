<%@ page contentType="text/html; charset=UTF-8"%>
<%
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
	}
	
	int result = 0;
	
	switch(sel)
	{
		case 1 : result = su1 + su2; break;  
		case 2 : result = su1 - su2; break;
		case 3 : result = su1 * su2; break;
		case 4 : result = su1 / su2; break;
	}		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
입력하신 <%=su1 %>와(과) <%=su2 %>의 연산 결과는 <%=result %>입니다.
</div>

</body>
</html>