/*=============
 BoardDAO.java
=============*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO
{
	
	// 주요 속성 구성
	private Connection conn;
	
	// 생성자 정의
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	
	// 게시물 번호의 최대값 얻어내기
	public int getMaxNum() throws SQLException
	{
		int result  = 0;
		
		String sql = "SELECT NVL(MAX(NUM), 0) AS MAXIMUM FROM TBL_BOARD";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getInt("MAXIMUM");
		
		rs.close();
		pstmt.close();
		
		return result ;
	}
	
	
	// 게시물 작성 → 데이터 입력
	public int insertData(BoardDTO dto)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
	
		try
		{
			// hitCount 는 기본값 『0』 또는 『default』 또는 『입력항목 생략』 가능
			// created 는 기본값 『sysdate』 또는 『default』 또는 『입력항목 생략』 가능
			sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2,  dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5,  dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7,  dto.getIpAddr());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
	}
	
	
	// DB 레코드의 갯수를 가져오는 메소드 정의 (지금은 전체~!!!)
	// → 검색 기능을 작업하게 되면... 수정하게 될 메소드 (검색 대상~!!!)
	public int getDataCount()
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				result = rs.getInt(1);
			rs.close();
			stmt.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을
	// 읽어오는 메소드 정의
	// → 검색 기능을 작업하게 되면... 수정하게 될 메소드 (검색 대상~!!!)
	public List<BoardDTO> getLists(int start, int end) throws SQLException
	{
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql = "";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM, DATA.*"
					+ " FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD')"
					+ " AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA )"
					+ " WHERE RNUM>=? AND RNUM<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery(sql);
			
			while (rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public int updateHitCount(int num) throws SQLException
	{
		int result = 0;
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql = "UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate(sql);
			
			pstmt.close();
		}
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO getReadData(int num)
	{
		BoardDTO result = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setPwd(rs.getString("PWD"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setContent(rs.getString("CONTENT"));
				dto.setIpAddr(rs.getString("IPADDR"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
			}
			rs.close();
			pstmt.close();
		}
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
}
