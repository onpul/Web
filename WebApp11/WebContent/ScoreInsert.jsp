<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 데이터 수신
	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor = 0;
	int eng = 0; 
	int mat = 0;
	
	// 점수 형변환
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
	}
	catch(Exception e)
	{ 
		System.out.println("점수 형변환에서 에러 발생");
		System.out.println(e.toString());
	}
	
	// 초기화
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		// ScoreDTO 구성
		ScoreDTO score = new ScoreDTO();
	
		score.setName(name);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
	
		// add() 메소드 호출 (insert 수행)
		dao.add(score);
	}
	catch(Exception e)
	{
		System.out.println("add() 메소드 호출에서 에러 발생");
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
	
	// 쪽지를 사용자에게 전달
	// 이 주소로 찾아가세요!
	response.sendRedirect("ScoreList.jsp");
%>