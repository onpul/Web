<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 쿠키 생성 (서버에 생성된 쿠키)
	Cookie c = new Cookie("cookie_test", "studyCookie");

	// 쿠키 설정
	c.setMaxAge(60); // n초 후에 사라짐
	
	// 쿠키 추가
	response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>쿠키 설정 및 추가</h1>
	<hr>
</div>

<div>
	<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
	<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
</div>

</body>
</html>