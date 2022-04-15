<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 값 수신
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	
	// Calendar 객체 생성
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	
	// 최초 접속 시 년 월은 현재 년 월로 초기화
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 선택 값이 있다면 선택 값으로 고정
	if(yearStr!=null || monthStr!=null)
	{
		selectYear = Integer.parseInt(yearStr);
		selectMonth = Integer.parseInt(monthStr);
	}
	
	if(selectMonth==0)
	{
		selectYear -= 1;
		selectMonth = 12;
	}
	if(selectMonth==13)
	{
		selectYear += 1;
		selectMonth = 1;
	}	
	
	// 선택 값으로 날짜 세팅
	cal.set(selectYear, selectMonth-1, 1);
	
	int lastDay = cal.getActualMaximum(Calendar.DATE); // 달의 마지막 날
	int yoil = cal.get(Calendar.DAY_OF_WEEK)-1; // 요일
	
	String[] yoilStr = {"일", "월", "화", "수", "목", "금", "토"};
	String calbox = "";
	
	calbox += "<table class='caltable' border='1' width='300px;'>";
	calbox += "<tr>";
	for (int i=0; i<yoilStr.length; i++) // 요일 출력
	{
		if (i==0)
			calbox += "<td style='color:red; background-color:#eeeeee;'>" + yoilStr[i] + "</td>";
		else if (i==6)
			calbox += "<td style='color:blue; background-color:#eeeeee;'>" + yoilStr[i] + "</td>";
		else	
			calbox += "<td style='background-color:#eeeeee;'>" + yoilStr[i] + "</td>";	
	}
	calbox += "</tr>";
	
	// 1일 전까지 공백 찍기
	calbox += "<tr>";
	
	for(int i=0; i<yoil; i++)
		calbox += "<td>" + " " + "</td>";
	
	int n = yoil;
	
	for (int i=1; i<=lastDay; i++, n++)
	{
		if (i>2 && n==0) // 둘째 줄부터 <tr> 열기
		{
			calbox += "<tr>";
		}
		calbox += "<td>" + i + "</td>";
		
		if (i == lastDay && n!=6)
		{
			for(int j=n; j<6; j++)
				calbox += "<td>" + " " + "</td>";
		}
		
		if (n == 6)
		{
			calbox += "</tr>";
			n = -1;
		}
	}	
	
	calbox += "</table>";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08_2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--  
	○ 데이터 송수신 실습 08
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해 주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
	   
	     ◀ 2022년 4월 ▶
	     
	     ------------------------------------
	     ------------------------------------
	     ------------------------------------
	     ------------------------------------
	     
	   - 『◀』 이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
	     
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/SendAndReceive08_2.jsp 로 한다.
	     
	○ SendAndReceive08_2.jsp
-->

<div>
	<h1>데이터 송수신 실습 08_2</h1>
	<hr>
</div>

<div>
	<form name="calForm" action="" method="get">
		<a href="SendAndReceive08_2.jsp?year=<%=selectYear %>&month=<%=selectMonth-1 %>">◀ </a>
		<input type="text" id="year" name="year" value=<%=selectYear %>>
		<input type="text" id="month" name="month" value=<%=selectMonth %>>
		<a href="SendAndReceive08_2.jsp?year=<%=selectYear %>&month=<%=selectMonth+1 %>"> ▶</a>
	</form>
</div>

<div>
	<%=calbox %>
</div>

</body>
</html>