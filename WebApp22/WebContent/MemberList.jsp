<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) 문제 해결</h1>
	<h2>회원 명단 출력</h2>
	<hr>
</div>

<div>
	<!-- 5명의 이름, 전화번호, 주소 출력 -->
	
	<%-- 
	<c:forEach var="dto" items="${lists }">
		${dto.name }
		${dto.tel }
		${dto.addr }
	</c:forEach> 
	--%>
	
	<%-- 
	<c:forEach var="dto" items="${lists }">
		<table class="table" style="text-align: center;">
			<tr>
				<th>이름</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${dto.tel }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${dto.addr }</td>
			</tr>
		</table>
	</c:forEach>
	--%>
	
	<table class="table" style="text-align: center;">
		<tr>
			<th>이름</th>
			<c:forEach var="dto" items="${lists }">
			<td>${dto.name }</td>
			</c:forEach>
		</tr>
		<tr>
			<th>전화번호</th>
			<c:forEach var="dto" items="${lists }">
			<td>${dto.tel }</td>
			</c:forEach>
		</tr>
		<tr>
			<th>주소</th>
			<c:forEach var="dto" items="${lists }">
			<td>${dto.addr }</td>
			</c:forEach>
		</tr>
	</table>
		
</div>

</body>
</html>