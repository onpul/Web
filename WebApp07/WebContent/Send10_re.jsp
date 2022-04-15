<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send10.jsp)로부터 데이터(userName) 수신
	// ①
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// 이 페이지에서 수행한 추가 작업
	// ②
	request.setAttribute("message", "반갑습니다.");
	//-- request 객체의 key(message)의 값 안에
	//   "반갑습니다."를 value 로 넣는 작업 수행
	// getAttribute로 받을 수 있음.
	
	// setAttribute는 obj 형태, getAttribute로 꺼내 쓸 때도 obj 형태.
	
	// ※ 리다이렉트 
	// ③
	response.sendRedirect("Receive10.jsp"); // 쪽지 전달하는 거 / 쪽지에 저걸 적어준 거.. / 상담원이 불러준 전화번호
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_re.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>리다이렉트</h2>
</div>

<div>
	<!-- <p>이름 : 이호석</p> -->
	<p>이름 : <%=userName %></p>
	
</div>

</body>
</html>