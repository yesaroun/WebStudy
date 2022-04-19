<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberDelete.jsp
	
	// 이전페이지(MemberSelect.jsp)로부터 넘어온 데이터(sid) 수신
	
	String sid = request.getParameter("sid");

	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		//dao.remove(sid); //(x)
		
		// 참조 레코드 수 확인
		
	}
	catch(Exception e)
	{
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
%>
