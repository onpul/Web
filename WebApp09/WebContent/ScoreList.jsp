<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수
	String result = "";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 수행
	ResultSet rs = stmt.executeQuery(sql);
	
	// ResultSet 처리
	result += "<table class='tbl' border='1'>";
	result += "<tr>";
	result += "<th>번호</th>";
	result += "<th>이름</th>";
	result += "<th>국어점수</th>";
	result += "<th>수학점수</th>";
	result += "<th>영어점수</th>";
	result += "<th>총점</th>";
	result += "<th>평균</th>";
	result += "</tr>";
	
	while (rs.next())
	{
		result += "<tr>";
		result += "<td>" + rs.getString("SID") + "</td>";
		result += "<td>" + rs.getString("NAME") + "</td>";
		result += "<td>" + rs.getString("KOR") + "</td>";
		result += "<td>" + rs.getString("ENG") + "</td>";
		result += "<td>" + rs.getString("MAT") + "</td>";
		result += "<td>" + rs.getString("TOT") + "</td>";
		result += "<td>" + String.format("%.1f", rs.getFloat("AVG")) + "</td>";
		result += "</tr>";
	}
	
	result += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#err1, #err2, #err3, #err4 {color: red; font-size: small; display: none;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		//alert("함수 호출");
		
		var name = document.getElementById("name");
		
		var korStr = document.getElementById("kor").value;
		var engStr = document.getElementById("eng").value;
		var matStr = document.getElementById("mat").value;
		
		//alert(korStr);
		
		var arr1 = document.getElementById("err1"); // 이름
		var arr2 = document.getElementById("err2"); // 국어
		var arr3 = document.getElementById("err3"); // 영어
		var arr4 = document.getElementById("err4"); // 수학
		
		arr1.style.display = "none"; 
		arr2.style.display = "none"; 
		arr3.style.display = "none"; 
		arr4.style.display = "none"; 
		
		var kor = parseInt(korStr);
		var eng = parseInt(engStr);
		var mat = parseInt(matStr);
		
		//alert(kor);
		
		if (name.value == "")
		{
			arr1.style.display = "inline";
			document.getElementById("name").focus();
			return false;
		}
		
		if (kor.value == "" || kor<0 || kor>100 || isNaN(kor))
		{
			arr2.style.display = "inline";
			document.getElementById("kor").focus();
			return false;
		}
		
		if (eng.value == "" || eng<0 || eng>100 || isNaN(eng))
		{
			arr3.style.display = "inline";
			document.getElementById("eng").focus();
			return false;
		}
		
		if (mat.value == "" || mat<0 || mat>100 || isNaN(mat))
		{
			arr4.style.display = "inline";
			document.getElementById("mat").focus();
			return false;
		}
	
		return true;
	}
</script>
</head>
<body>

<!--  
	○ WebApp09
	
	   - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	     총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
	   - 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	   - 데이터베이스 연동하여 처리한다.
	     (TBL_SCORE, SCORESEQ 활용)
	   - 즉, 성적 처리 프로그램을 데이터베이스 연동하여
	     JSP로 구성할 수 있도록 한다.
	     
	     데이터베이스 연결 및 데이터 처리
	     -------------------------------------------------------------
	     성적 처리
	     
	     이름(*)	[ textbox ] → 이름 입력 확인
	     국어점수 	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     영어점수 	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     수학점수 	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     
	     < 성적 추가 >			→ button
	     
	     번호		이름		국어점수 영어점수 수학점수		총점		평균
	     1		   이시우          90       80       70         xxx			xx.x
	     2		   이윤태          80       70       60         xxx			xx.x
	     3		   홍은혜          70       60       70         xxx			xx.x
	     
	○  WebApp09_scott.sql
	    ScoreList.jsp
	    ScoreInsert.jsp
	    com.util.DBConn.java
-->

<div>
	<h3>데이터베이스 연결 및 데이터 처리</h3>
	<hr />
	<h4>성적 처리</h4>
	
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		이름(*) <input type="text" id="name" name="name"/><span id="err1"> 이름을 입력해 주세요.</span><br /> 
		국어 점수 <input type="text" id="kor" name="kor"/><span id="err2"> 0~100 사이의 수를 입력해 주세요.</span><br /><br />
		영어 점수 <input type="text" id="eng" name="eng"/><span id="err3"> 0~100 사이의 수를 입력해 주세요.</span><br /><br />
		수학 점수 <input type="text" id="mat" name="mat"/><span id="err4"> 0~100 사이의 수를 입력해 주세요.</span><br /><br />
		<br />
	
		<button type="submit">성적 추가</button>
	</form>
	<br />
	
	<div>
		<!-- 처리 결과 -->
		<%=result %>
	</div>
	
</div>

</body>
</html>