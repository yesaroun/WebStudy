<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession01_1.jsp
	request.setCharacterEncoding("UTF-8");
	// 넘어온 데이터 받기
	String UserName = request.getParameter("inputName");
	String UserTel = request.getParameter("inputTel");
	
	session.setAttribute("UserName", UserName);
	session.setAttribute("UserTel", UserTel);
	
	response.sendRedirect("TestSession02.jsp");
%>
