<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// Send02.html 페이지로부터 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String nameStr = request.getParameter("userName");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor, eng, mat;
	kor=eng=mat=0;
	
	int tot = 0;
	double avg = 0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		avg = tot / 3.0;
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}

// 내 풀이
/* 
	request.setCharacterEncoding("UTF-8");
	
	String nameStr = request.getParameter("userName");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor=0;
	int eng=0;
	int mat=0;
	
	try
	{
		// 형 변환
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}

	// 총점
	int tot = kor + eng + mat;
	
	// 평균
	double avg = Math.floor((tot / 3.0)*100/100.0);
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습02</h1>
	<hr>
</div>

<div>
	<span style="color:blue"><%=nameStr %></span>님, 성적 처리가 완료되었습니다.<br>
	회원님의 점수는 국어:<%=kor %>점, 영어:<%=eng %>점, 수학:<%=mat %>점 입니다.<br>
	총점은 <%=tot %>점, 평균은 <%=String.format("%.1f", avg) %> 입니다.
</div>

<!-- 내 풀이 -->
<%-- 
<div>
	<%=nameStr %>님, 성적 처리가 완료되었습니다.<br>
	회원님의 점수는 국어:<%=kor %>점, 영어:<%=eng %>점, 수학:<%=mat %>점 입니다.<br>
	총점은 <%=tot %>점, 평균은 <%=avg %> 입니다.
</div>
--%>
</body>
</html>