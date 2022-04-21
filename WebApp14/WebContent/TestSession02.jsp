<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 이전 페이지(TestSession01.jsp)로부터 데이터(userName, userTel) 수신
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	// check~!!!
	// 추가~!!!
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);

	/* 
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	session.setAttribute("name", name);
	session.setAttribute("tel", tel);
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//session.setAttribute("id", id);
	//session.setAttribute("pwd", pwd);
	
	if (id != null && pwd != null)
		response.sendRedirect("TestSession03.jsp"); 
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

	function sendIt()
	{
		var f = document.forms[0];
		
		if (!f.userId.value)
		{
			alert("아이디 입력~!!!");
			f.userId.focus();
			return;
		}
		
		if (!f.userPwd.value)
		{
			alert("패스워드 입력~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}
	
/* 	
	function formSubmit()
	{
		//alert("함수");		
		
		var myForm = document.getElementById("myForm");
		
		myForm.submit();
	} 
*/

</script>
</head>
<body>

<div>
	<h1>아이디와 패스워드(TestSession02.jsp)</h1>
</div>

<div>
	<form action="TestSession03.jsp" method="post" id="myForm">
		아이디 <input type="text" name="userId" class="txt"/><br />
		패스워드 <input type="text" name="userPwd" class="txt"/><br />
		<button type="button" onclick="sendIt()">다음 페이지로 전송</button>
	</form>
</div>

</body>
</html>