<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//JsonTest02_ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	// 반환해 줄 쿼리 스트링
	String result = "";
	
	// JSON 데이터(배열)
	// [{"이름1":"값1", "이름2":"값2", "이름3":"값3"}, {"이름1":"값1", "이름2":"값2", "이름3":"값3"}, {"이름1":"값1", "이름2":"값2", "이름3":"값3"}]
	
	// {"num":"1", "name":"임OO1", "content":"안녕하세요!1"},
	// {"num":"2", "name":"임OO2", "content":"안녕하세요!2"},
	// {"num":"3", "name":"임OO3", "content":"안녕하세요!3"},
	// {"num":"4", "name":"임OO4", "content":"안녕하세요!4"},
	// {"num":"5", "name":"임OO5", "content":"안녕하세요!5"},
	
	//					↓
	
	// {"num":"1", "name":"임OO1", "content":"안녕하세요!1"},
	// {"num":"2", "name":"임OO2", "content":"안녕하세요!2"},
	// {"num":"3", "name":"임OO3", "content":"안녕하세요!3"},
	// {"num":"4", "name":"임OO4", "content":"안녕하세요!4"},
	// {"num":"5", "name":"임OO5", "content":"안녕하세요!5"}			← 마지막 컴마 제거	

	//						↓
	
	// [{"num":"1", "name":"임OO1", "content":"안녕하세요!1"},
	// {"num":"2", "name":"임OO2", "content":"안녕하세요!2"},
	// {"num":"3", "name":"임OO3", "content":"안녕하세요!3"},
	// {"num":"4", "name":"임OO4", "content":"안녕하세요!4"},
	// {"num":"5", "name":"임OO5", "content":"안녕하세요!5"}]
			
	for(int n=1; n<=5; n++)
	{
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"num\":\"" + n + "\"");					// {"num":" O "
		sb.append(",\"name\":\"" + name + n + "\"");				// , "name":" O " 
		sb.append(",\"content\":\"" + content + n + "\"},");		// , "content":" O "}		//check!! 『,』
		
		result += sb.toString();
	}
	
	// 마지막 『,』 제거(탈락)
	result = result.substring(0, result.length()-1);
	
	// json 배열 객체 구성
	result = "[" + result + "]";
	
	out.println(result);

%>
