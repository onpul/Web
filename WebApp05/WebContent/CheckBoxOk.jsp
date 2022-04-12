<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");

	String nameStr = request.getParameter("name");
	String memoStr = request.getParameter("memo");
	
	memoStr = memoStr.replace("\n", "<br>");
	
	String[] checkArr = request.getParameterValues("checkGroup");
	
	String check = "";
	
	for(int i = 0; i<checkArr.length; i++)
		check += "[" + checkArr[i] + "] "; 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp ○ → CheckBoxOk.jsp ●</p>
</div>

<div>
	<h2>수신 데이터 확인</h2>
	
	<!-- <h3>이름 : 신시은</h3> -->
	<h3>이름 : <%=nameStr %></h3>
	
	<h3>메모</h3>
	<!-- <p>나는<br> 오타없이<br> 점점 타이핑이 빨라지고 있다.</p> -->
	<p><%=memoStr %></p>
	
	<%-- <h3>이상형 : [임시완] [남주혁] [강동원]</h3> --%>
	<h3>이상형 : <%=check %></h3>
</div>

</body>
</html>