<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 선택한 년 월 수신
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	int year = 0;
	int month = 0;
	
	// 최초 접속 시, 현재 날짜를 기준으로 option 구성해야 함.
    // 캘린더 객체 생성
    Calendar cal = Calendar.getInstance();
    
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH)+1;
    
 	// 최초 접속 시(선택 값이 없을 때) 현재 날짜 넣어놓기
    year = nowYear;
    month = nowMonth;
	
	// 선택한 값이 있다면
	// 선택한 년 월을 정수형으로 변환
	if (yearStr!=null || monthStr!=null)
	{
		try
		{
			year = Integer.parseInt(yearStr);
			month = Integer.parseInt(monthStr);
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 옵션값 표현식으로 넣을 거니까 문자열 변수로 선언
	String yearOpt = "";
    String monthOpt = "";
    
    // yearOpt += <option value="2022">2022</option> 
    // 년도 값 넣기!!!
    for(int i=(year-10); i<=(year+10); i++)
    {
    	if(yearStr == null && i==nowYear) // 선택 값이 현재 년도면 현재 년도 selected
    		yearOpt += "<option value="+ i + " selected='selected'>" + i + "</option>";
    	else if(yearStr != null && i==year) // 선택 값이 현재 년도가 아니면 선택 값을 selected
    		yearOpt += "<option value="+ i + " selected='selected'>" + i + "</option>";
    	else
    		yearOpt += "<option value="+ i + ">" + i + "</option>";
    }
 	   
 	// 월 값 넣기!!!
    for(int i=1; i<=12; i++)
    {
    	if(monthStr == null && i==nowMonth) // 선택 값이 현재 년도면 현재 년도 selected
    		monthOpt += "<option value="+ i + " selected='selected'>" + i + "</option>";
    	else if(monthStr != null && i==month) // 선택 값이 현재 년도가 아니면 선택 값을 selected
    		monthOpt += "<option value="+ i + " selected='selected'>" + i + "</option>";
    	else
    		monthOpt += "<option value="+ i + ">" + i + "</option>";
    }
	
 	// 달력 그리기
 	String calbox = "";

 	// 테이블 만들어 보자
 	//calbox += "<table class='caltable'; border='1'>";
 	//calbox += "<tr><td colspan='7'>" + year + "년 " + month + "월</td></tr>";
 	//calbox += "<tr><td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td></tr>";
 	
 	// 달력 채우기
 	int total = 0;
 	
 	// 1년 1월 1일 ~ 해당 년도-1년 12월 31일
 	total += (year-1)*365 + ((year-1)/4) - ((year-1)/100) + ((year-1)/400);
 	
 	// + 해당 년도 해당 월 1일까지
 	int[] day = {31, 28, 31, 30, 31, 30, 31, 31, 30, 30, 30, 31}; // 각 달 마지막 날짜
 	
 	if(year%4==0 && year%100!=0 || year%400==0) // 윤년이면 2월은 29일로 바꾸기
 		day[1] = 29;
 	
 	for(int i=0; i<month-1; i++) // 4월 → 0 1 2 (3월까지)
 		total += day[i];
 	total += 1;
 	
 	// 해당 월 1일의 요일 구하기
 	int yoil = total % 7;
 	
 	String[] yoilStr = {"일", "월", "화", "수", "목", "금", "토"};
 	
 	// 달력 그리기
 	//for (int i=1; i<=5; i++)
 		//calbox += "<tr></tr>";
 	
 	//calbox += "</table>";
	
 	// 1일 전까지 공백
	for(int i=0; i<yoil; i++)
		calbox += "<td>" + " " + "</td>";
	
	int n = yoil;
	
	for (int i=1; i<=day[month-1]; i++, n++)
	{
		if (i>2 && n==0)
		{
			calbox += "<tr>";
		}
		calbox += "<td>" + i + "</td>";
		
		if (i == day[month-1] && n!=6)
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
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.caltable
	{
		text-align: center;	
	}
</style>
<script type="text/javascript">
	function submit(obj)
	{
		obj.submit;
	}
</script>
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
	<form action="" method="post" >
		<select id="year" name="year" onchange="submit(this.form)"><%=yearOpt %></select> 년
		<select id="month" name="month" onchange="submit(this.form)"><%=monthOpt %></select> 월
	</form>
</div>
<br>

<div class="caldiv">
	<table class="caltable" border="1">
		<tr><td colspan="7"><%=year %>년 <%=month %>월</td></tr>
		<tr>
			<%
				for(int i=0; i<7; i++)
				{
			%>
					<td><%=yoilStr[i] %></td>
			<%
				}
			%>		
		</tr>
		<%=calbox %>
	</table>
</div>

</body>
</html>