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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("확인");
			
			var params = "title=" + $.trim($("#title").val()) 
			           + "&content=" + $.trim($("#content").val());
			
			//alert($("#content").val());
			
			$.ajax(
			{
				// 수업 풀이
				type:"POST"
				, url:"AjaxTest03_ok.jsp"
				, data:params
				, dataType:"xml"
				, success:function(xml)
				{
					$(xml).find("status").each(function()
					{
						var status = $(this).text();
						//alert(status);					// 확인
					});
					
					var str = "";
					
					$(xml).find("records").each(function()
					{
						var records = $(this);
						var id = records.attr("id");
						var title = $(this).find("title").text();
						var content = $(this).find("content").text();
						
						str += ">> id=" + id + "<br>- title=" + title
							+ "<br>- content=" + content + "<br><br>";
					});
					
					$("#resultDiv").html(str);
				}
				, beforeSend:showRequest
				
				// 내 풀이
				/*
				type:"POST"
				, url:"AjaxTest03_ok.jsp"
			    , data:params
			    , dataType:"xml"
			    , success:function(data)
			    {
			    	var out = "";
			    	
			    	$(data).find("comment").each(function()
					{
						var item = $(this);
						var num = item.attr("num");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						out += "<br>id=" + num + "<br>- title=" + title;
						out += "<br>- content=" + content;
						
						//alert(item);
						//alert(num);
						//alert(title);
						//alert(content);
						
					});
			    	
			    	$("#resultDiv").html(out);
			    	
			    	$("#title").val("");
			    	$("#content").val("");
			    	$("#title").focus();
			    }
			    , beforeSend:showRequest
			    , error:function(e)
			    {
			    	alert(e.responseText);
			    }
			    */
			});
		});
	});
	
	function showRequest()
	{
		if(!$.trim($("#title").val()))
		{	
			alert("제목을 입력하세요.");
			$("#title").focus();
			
			return false;
		}
		if(!$.trim($("#content").val()))
		{
			alert("내용을 입력하세요.");
			$("#content").focus();
			
			return false;
		}
		
		return true;
	}

</script>
</head>
<body>

<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
	<p>xml control</p>
	<hr>
</div>

<div>
	제목 <input type="text" id="title" class="txt"/><br><br>
	내용 <input type="text" id="content" class="txt"/><br><br>

	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn"/>
</div>
<br><br>

<div id="resultDiv">
<!-- 
>> id=1
- title=테스트
- content=반갑습니다

>> id=2
- title=테스트
- content=반갑습니다
-->
</div>

</body>
</html>