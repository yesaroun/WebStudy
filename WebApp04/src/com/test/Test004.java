/*
	Test004.java
	- Servlet 실습
*/

// 현재... 자바의 기본 클래스 Test004
// 이를 Servlet으로 구성하는 방법

// GenericServlet 을 상속받는 클래스로 설계 → Servlet

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//import javax.servlet.Servlet;

//public class Test004 implements Servlet			// (Servlet은 다 상속받으면 너무 많아서 그 하위 객체인 GenericServlet을 상속받음)
//public abstract class Test004 extends GenericServlet //(abstract 붙여야하는데 override해서 abstract 없이 함)
public class Test004 extends GenericServlet			//(경고창뜰텐데 그건 객체 직렬화와 관련된 문제 그래서 add serial version ID 하면된다.)
{
	private static final long serialVersionUID = 1L;

	// GenericServlet 의 추상 메소드 재정의~!!!(source→Override/ime~ 에 체크)
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{
		// 요청에 대한 응답 방법
		response.setContentType("text/html; charset=UTF-8");
		
		try
		{
			// 출력 스트림 구성
			PrintWriter out = response.getWriter();
			
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("Test004.java");
			out.print("</title>");
			out.print("</head>");
			
			out.print("<body>");
			out.print("<div>");
			out.print("<h1>");
			out.print("서블릿 관련 실습");
			out.print("</h1>");
			out.print("</div>");
			
			out.print("<div>");
			out.print("<h2>");
			out.print("GenericServlet 클래스를 이용한 서블릿 테스트");
			out.print("</h2>");
			out.print("</div>");
			
			out.print("</body>");
			
			out.print("</html>");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

}
















