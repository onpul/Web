/*====================
	DBCPConn.java
====================*/

package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;
	
	public static Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				// ○ 이름과 객체를 바인딩
				//-- 컨텍스트(Context)를 얻어내는 가장 쉬운 방법은
				//   『javax.naming.InitialContext』클래스의
				//   인스턴스를 생성하는 것이다.
				//   → 『new InitialContext();』
				Context ctx = new InitialContext();
				// usb를 꺼내오는 통... -> context
				// 게임팩을 얻어내는 과정
				
				// ※ javax.naming.InitialContext 의 메소드
				//    - bind(String str, Object obj)
				//      : 서비스할 객체를 특정 이름으로 등록한다.
				//    - rebind(String str, Object obj)
				//      : 서비스할 객체를 특정 이름으로 다시 등록한다.
				//    - list(String str)
				//      : 특정 이름으로 서비스하는 객체 정보를 반환한다.
				//    - unbinding(String str)
				//      : 등록된 객체를 메모리에서 해제한다.
				//    - Object lookup(String str) ★★★★★
				//      : 서비스 중인 객체 정보를 얻어온다.
				
				// 『web.xml』로부터 환경 설정을 얻어오겠다는 코딩
				//-- 다른 형태로 변경 불가
				Context evt = (Context)ctx.lookup("java:/comp/env"); // 다운캐스팅
				// 닌텐도 객체 생성
				
				DataSource ds = (DataSource)evt.lookup("jdbc/myOracle"); // 다운캐스팅
				// web.xml 안의 내용 중에 myOracle 참조하는 내용을 통해 데이터 소스 얻어내겠다
				// 슈퍼마리오 객체 얻어 냄 (닌텐도 객체 활용해서)
				
				conn = ds.getConnection();
				// 커진 마리오 얻어냄...
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return conn;
	}
	
	public static void close()
	{
		if (conn != null)
		{
			try
			{
				if (!conn.isClosed())
					conn.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		conn = null;
	}
	
}
