<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 데이터 수신(Send04.html → Receive04.jsp)
	
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userCity = request.getParameter("userCity");
	
	//String userSubject = request.getParameter("userSubject");
	
	// check~!!!
	String[] userSubjectArr = request.getParameterValues("userSubject");
	
	String subjectStr = "";
	
	if (userSubjectArr != null) // 배열일 때 널 값 확인하자!!!
	{
		for (int i=0; i<userSubjectArr.length; i++)
		{
			subjectStr += " [" + userSubjectArr[i].toString() + "]";
			//                                    스트링 확인 사살인 듯?
		}
	}
	
	// ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB 에 입력하는
	//    처리 과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.

// 내 풀이
/* 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");

	if (gender.equals("m"))
		gender = "남자";
	else
		gender = "여자";

	String city = request.getParameter("city");
	
	switch(Integer.parseInt(city))
	{
		case 1: city = "서울"; break;
		case 2: city = "대전"; break;
		case 3: city = "대구"; break;
		case 4: city = "광주"; break;
	}
	
	String[] subArr = request.getParameterValues("subject");
	String sub = "";
	
	for(int i=0; i<subArr.length; i++)
		sub += subArr[i] + " ";
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>가입 승인 내역</h2>
	
	<!-- <p>아이디 : superman</p> -->
	<p>아이디 : <%=userId %></p>
	
	<!-- <p>패스워드 : 1234</p> -->
	<p>패스워드 : <%=userPw %></p>
	
	<!-- <p>이름 : 이호석</p> -->
	<p>이름 : <%=userName %></p>
	
	<!-- <p>전화번호 : 010-1111-1111</p> -->
	<p>전화번호 : <%=userTel %></p>
	
	<!-- <p>성별 : 남성</p> -->
	<p>성별 : <%=userGender %></p>

	<!-- <p>지역 : 서울</p> -->
	<p>지역 : <%=userCity %></p>
	
	<!-- <p>수강과목 : [자바기초] [오라클중급]</p> -->
	<p>수강과목 : <%=subjectStr %></p>
</div>

<!-- 내 풀이 -->
<%-- 
<div>
	id : <%=id %><br>
	pwd : <%=pwd %><br>
	name : <%=name %><br>
	gender : <%=gender %><br>
	city : <%=city %><br>
    sub : <%=sub %><br>
</div>
--%>
</body>
</html>