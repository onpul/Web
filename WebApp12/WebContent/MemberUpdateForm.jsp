<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// sid 수신
	// 수신한 sid를 가지고 회원 데이터 조회
	// 조회해서 얻어낸 데이터를 폼에 구성
	
	// 이전 페이지로(MemberSelect.jsp)부터 데이터(sid) 수신
	String sid = request.getParameter("sid");
	String name = "";
	String tel = "";
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		MemberDTO member = dao.searchMember(sid);
		name = member.getName();
		tel = member.getTel();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdateForm.jsp</title>
<link rel="stylesheet" href="css/MemberScore.css" type="text/css" >

<script type="text/javascript">
	function memberSubmit()
	{
		//alert("함수 호출 확인");
		
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		//이거 하는 이유. 초기화하려고
		nameMsg.style.display = "none";
		if (uName.value =="")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			// 함수 끝내기.
			return;
		}
		
		// form을 직접 지정하여 submit 액션 수행
		memberForm.submit();
	}
	
	function memberReset()
	{
		//alert("확인");
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display ="none";
		// form을 직접 지정하여 reset 액션 수행
		memberForm.reset();
		uName.focus();
		
		//return;
	}
</script>

</head>
<body>
<div>
	<h1>회원 <span style="color:red; ">명단</span> 관리
	      및 <span style="color:blue; ">수정</span> 페이지</h1>
	<hr />
</div>

<div><a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a></div>
<br />
<div>
	<!-- 회원 데이터 수정 폼 구성 -->
	<!-- sid 어떻게 넘겨주지 두번째 방법 -->
	<form action="MemberUpdate.jsp?sid=<%=sid %>"method="post"id="memberForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td><input type="text" id="uName" name="uName" value="<%=name %>" /></td>
				<td><span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="uTel" name="uTel" value="<%=tel %>"/></td>
				<td></td>
			</tr>
		</table>
		<!-- 
			sid 어떻게 넘겨주지 첫번째 방법 
			폼 안에 있어서 다음 페이지 수신할 때 넘겨줄 수 있음
		-->
		<%-- <input type="hidden" name="sid" value="<%=sid %>"> --%>
		<br />
		<a href="javascript:memberSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>