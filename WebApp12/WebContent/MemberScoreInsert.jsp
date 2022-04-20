<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreInsert.jsp
	
	request.setCharacterEncoding("UTF-8");

	//이전 페이지(MemberScoreInsertFrom.jsp)로부터 데이터(kor, eng, mat)수신
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신된 데이터로 MemberScoreDTO 구성 → add() 메소드의 매개변수
		MemberScoreDTO dto = new MemberScoreDTO();

		dto.setSid(sid);
		dto.setKor(Integer.parseInt(kor));
		dto.setEng(Integer.parseInt(eng));
		dto.setMat(Integer.parseInt(mat));
		
		// dao의 add() 메소드 호출 → 데이터 입력(insert 쿼리문 수행)
		dao.add(dto);
		
		// 위의 메소드가 반환하는 값에 따라 결과 분기 처리 가능~!!!
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
	
	// 새로운 페이지 요청할 수 있도록 다시 안내
	response.sendRedirect("MemberScoreSelect.jsp");

%>
