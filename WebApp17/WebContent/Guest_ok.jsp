<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean> <!-- scope 없으면 page -->
<%-- 
<jsp:setProperty property="userName" name="ob"/>
<jsp:setProperty property="subject" name="ob"/>
<jsp:setProperty property="content" name="ob"/> 
--%>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 작성해서 넘긴 내용 확인 -->
<!-- 이름, 제목, 내용 -->
<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div>	
	<h2>작성된 내용 확인</h2>
	이름 : <%=ob.getUserName() %><br>
	제목 : <%=ob.getSubject() %><br>
	내용 : <%=ob.getContent().replaceAll("\n", "<br>") %> <!-- 개행 check~!!! -->
</div>

</body>
</html>