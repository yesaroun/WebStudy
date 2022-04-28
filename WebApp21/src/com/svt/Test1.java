/*=================
	Test1.java
=================*/

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
{
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
		// ①
		/*
		String name = "홍길동";
		String age = "19";
		
		response.setContentType("text/html;charset=UTF-8");			//
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		// ②
		
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화할 때
		//   서블릿 당 하나씩 ServletConfig을 생성하게 된다.
		ServletConfig config = getServletConfig();
		
		// 『web.xml』에 『<init-param>』
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		/*
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		// ③
		// 『ServletContext』
		//-- ServletConfig는 서블릿에 대한 환경을 설정하는 과정에서
		//	 필요한 값들을 전달하는 형태로 주로 사용된다면
		//	 ServletContext 는 서블릿에서 사용되는 컨텍스트를
		//	 구성하는 형태로 활용된다.
		
		ServletContext context = getServletContext();
		
		// 『web.xml』에 『<context-param>』 사용 가능
		String type = context.getInitParameter("type");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</body>");
		pw.println("</html>");
	}
}
