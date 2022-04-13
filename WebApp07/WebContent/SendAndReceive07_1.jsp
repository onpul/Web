<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 선택한 년 월 수신
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	// 옵션값 표현식으로 넣을 거니까 문자열 변수로 선언
	String yearOpt = "";
    String monthOpt = "";
    
    // yearOpt += <option value="2022">2022</option> 
    
    // 최초 접속 시, 현재 날짜를 기준으로 option 구성해야 함.
    // 캘린더 객체 생성
    Calendar cal = Calendar.getInstance();
    
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH)+1;
    
    // 최초 접속 시 옵션은 현재 날짜 기준으로 구성
    for(int i=nowYear-10; i<=nowYear+10; i++)
    	yearOpt += 
    

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--  
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 구성은 현재의 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	     (기본적으로 만년달력을 구성하는데 현재의 연, 월은 달력 객체로부터 확인할 수 있도록 한다.)
	   - 월 구성은 1월부터 12월 까지로 구성한다.
	   
	     [ 2022 ▼ ] 년  [ 4 ▼ ] 월
	     
	     ---------------------------
	     ---------------------------
	     ---------------------------
	     ---------------------------
	     
	   - 연도 select 나 월 select 의 내용이 변화되면
	     해당 연 월의 달력을 출력해 주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/SendAndReceive07_1.jsp 로 한다.
	
	○ SendAndReceive07_1.jsp 
-->

<div>
	<h1>데이터 송수신 실습 07_1(복습)</h1>
	<hr>
</div>

<div>
	<form action="" method="post">
		<select id="year" name="year"></select> 년
		<select id="month" name="month"></select> 월
	</form>
</div>

</body>
</html>