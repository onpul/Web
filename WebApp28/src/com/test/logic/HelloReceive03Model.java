/*==============================
	HelloReceive03Model.java
==============================*/

package com.test.logic;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result = "";

		request.setCharacterEncoding("UTF-8");
		// 일단 클래스의 메소드에서는
		// 기존 시스템에서 지원하지 않는 인코딩일지도 모른다.
		// -> throws
		
		// 데이터 수신 
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		// 추가적인 업무 처리 삽입
		lastName = "[" + lastName + "]";
		
		// 데이터 전달
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		
	    // 상황에 따른 뷰 선택(지정) 가능~!!!
		result = "WEB-INF/view/HelloReceive03.jsp"; 
		// Q. MVC 패턴에 적합한 게 맞는지?
		// A. ㅇㅇ 
		
		return result;
		// 메소드가 void가 되어도 상관 없다. 
		// 근데 만든 주방장은 모델이고~ 어떤 그릇에 담겨 내놓을지는 너가 알려줬음 좋겠어!
		// -> result에 그릇 종류 담음
	}
}