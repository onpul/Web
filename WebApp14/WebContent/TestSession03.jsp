<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession02.jsp)로부터 데이터(userId, userPwd) 수신
	
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");

	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");
	
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
	// 옮겨 담았으면 필요없으니까 세션 비워도 된다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h2>이름, 전화번호, 아이디, 패스워드 출력</h2>
	<h3>(TestSession03.jsp)</h3>
</div>

<div>
	이름 : <%=userName %><br>
	전화번호 : <%=userTel %><br>
	아이디 : <%=userId %><br>
	패스워드 : <%=userPwd %><br>
</div>

</body>
</html>