<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	try                          
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 준비
	String sql  = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", name, kor, eng, mat);
	
	// 쿼리문 수행
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	if (result < 1) 
	{
		response.sendRedirect("Error.jsp");
	}
	else
	{
		response.sendRedirect("ScoreList.jsp");
	}

%>