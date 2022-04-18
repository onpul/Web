<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String countStr = "<span id='count'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		countStr += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th></tr>");
		
		// ScoreDAO 객체의 lists() 메소드 호출
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + score.getSid() + "</td>");
			str.append("<td>" + score.getName() + "</td>");
			str.append("<td>" + score.getKor() + "</td>");
			str.append("<td>" + score.getEng() + "</td>");
			str.append("<td>" + score.getMat() + "</td>");
			str.append("<td>" + score.getTot() + "</td>");
			str.append("<td>" + score.getAvg() + "</td>");
			str.append("</tr>");
		}
		str.append("</table>");
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	body {background-color: lightyellow;}
	#err1, #err2, #err3, #err4 {color: lightyellow; font-size: small;}
	.box {text-align: center; width: 100%;}
	ul {list-style: none; padding: 0px; display: flex; justify-content: flex-start; align-items: center; }
	#title {width: 100px;}
	button {width : 200px; height: 40px; border-radius: 5px;}
	#count {float: left; margin-bottom: 5px; font-size: small; font-weight: bold;}
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
		
		arr1.style.color = "ligthyellow"; 
		arr2.style.color = "ligthyellow"; 
		arr3.style.color = "ligthyellow"; 
		arr4.style.color = "ligthyellow"; 
		
		var kor = parseInt(korStr);
		var eng = parseInt(engStr);
		var mat = parseInt(matStr);
		
		//alert(kor);
		
		if (name.value == "")
		{
			arr1.style.color = "red";
			document.getElementById("name").focus();
			return false;
		}
		
		if (kor.value == "" || kor<0 || kor>100 || isNaN(kor))
		{
			arr2.style.color = "red";
			document.getElementById("kor").focus();
			return false;
		}
		
		if (eng.value == "" || eng<0 || eng>100 || isNaN(eng))
		{
			arr3.style.color = "red";
			document.getElementById("eng").focus();
			return false;
		}
		
		if (mat.value == "" || mat<0 || mat>100 || isNaN(mat))
		{
			arr4.style.color = "red";
			document.getElementById("mat").focus();
			return false;
		}
	
		return true;
	}
</script>
</head>
<body>

<div class="box">
	<h3>데이터베이스 연결 및 데이터 처리</h3>
	<hr />
	<h4>성적 처리</h4>
	
	<div class="formbox">
		<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<ul>
			<li id="title">이름(*)</li>
			<li><input type="text" id="name" name="name"/><span id="err1"> 이름을 입력해 주세요.</span></li>
		</ul>
		<ul>
			<li id="title">국어 점수</li>
			<li><input type="text" id="kor" name="kor"/><span id="err2"> 0~100 사이의 수를 입력해 주세요.</span></li>
		</ul>
		<ul>
			<li id="title">영어 점수</li>
			<li><input type="text" id="eng" name="eng"/><span id="err3"> 0~100 사이의 수를 입력해 주세요.</span></li>
		</ul>
		<ul>
			<li id="title">수학 점수</li>
			<li><input type="text" id="mat" name="mat"/><span id="err4"> 0~100 사이의 수를 입력해 주세요.</span></li>
		</ul>
			<button type="submit">성적 추가</button>
		</form>
	</div>
	
	<br />
	
	<div class="result">
		<!-- 처리 결과 -->
		<!-- 인원 수 -->
		<%=countStr %>
		
		<!-- 결과 표 -->
		<%=str.toString() %>
	</div>
	
</div>

</body>
</html>