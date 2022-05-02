<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// MemberInsert.jsp
	
	// 5명분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	//                      MemberDTO
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	for(int i=1; i<=5; i++)
	{
		String name = request.getParameter("name"+i);
		String tel = request.getParameter("tel"+i);
		String addr = request.getParameter("addr"+i);
		
		/* 
		MemberDTO ob = new MemberDTO(name, tel, addr);
		lists.add(ob);
		*/
		
		MemberDTO ob = new MemberDTO(
				request.getParameter("name"+i)
			  , request.getParameter("tel"+i)
			  , request.getParameter("addr"+i) );
		
		lists.add(ob);
	}

	//MemberDTO ob = new MemberDTO("테스트", "테스트", "테스트");
	
	session.setAttribute("lists", lists);
	// request.setAttribute

	
	// MemberList.jsp 를 요청할 수 있도록 안내
	//response.sendRedirect("MemberList.jsp");
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>