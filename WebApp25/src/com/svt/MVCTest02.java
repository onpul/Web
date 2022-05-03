/* =============================================
	MVCTest02.java
	- Controller 역할을 수행할 서블릿 클래스
============================================= */

package com.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.MVCTest02Model;

public class MVCTest02 extends HttpServlet
{
	// 클래스명에 마우스 올리고 첫번째
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		
		// 모델 객체 생성 및 모델이 처리한 결과 수신(View 정보 획득)
		MVCTest02Model model = new MVCTest02Model();
		String view = model.actionCount(request, response);
		// 컨트롤러는 모델한테 일 시킨 거
		
		RequestDispatcher rd = request.getRequestDispatcher(view); // 뷰한테 일 시켜~
		rd.forward(request, response);
	}

}
