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
<title>GetTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
	body
	{
		font-size: 10pt;
		font-family: 맑은 고딕;
	}
	#resultDiv
	{	
		width: 180px;
		height: 180px;
		border: 3px solid green;
		border-radius: 10px;
		paddin: 3px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$("#loadBtn").click(function()
		{
			// 테스트
			//alert("테");
			
			var nickName = $("#nickName").val();
			
			$.get("GetTest02_ok.jsp", {nickName:nickName}, function(txt)
			{
				$("#resultDiv").html(txt);
			});
		});
		
		$("#clearBtn").click(function()
		{
			$("#resultDiv").empty();
		})
	});
	
</script>
</head>
<body>

<div>
	<h1>jQuery의 get() 활용 실습</h1>
	<hr />
</div>

<div>
	<input type="text" id="nickName" class="txt"/>
	<br />
	
	<button type="button" id="loadBtn" class="btn">눌러보쟈</button>
	<button type="button" id="clearBtn" class="btn">지워보쟈</button>
</div>
<br />

<div id="resultDiv">
</div>

</body>
</html>