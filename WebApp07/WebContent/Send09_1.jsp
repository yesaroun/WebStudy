<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String result = "";
	result += "<ul>";
	for(int i=1; i<=9; i++)		//1 ~ 9
	{
		/* result += String.format("<li><a>%d단</a></li>", i); */
		/* result += String.format("<li><a href='Receive09_1.jsp?gugudan=%d'>%d단</a></li>", i, i); */
		result += String.format("<li><a href='Receive09_1.jsp?gugudan=%1$d'>%1$d단</a></li>", i);
	}		/* (%1$ 는 printf, format에서 괄호 첫번째값, %2$는 다음값 ...) */
	result += "</ul>";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	a {text-decoration: none;}
</style>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 09
	   - a 태그(링크 태그)에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
	   - 이를 활용하여 구구단 리스트를 동적으로 구성하여
	     선택에 따른 결과 페이지를 출력해주는 형태의 페이지를 구현한다.
	   - submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   
	     구구단 선택
	     
	     1단	→ (목록 구성)
	     2단
	     3단
	      :
	     7단
	     8단
	     9단
	     
	   - 리스트의 특정 단을 클릭했을 때
	     구구단을 출력해주는 형태의 페이지(Receive09.jsp)로 구현한다.
	   
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/Send09.jsp로 한다.
	  
	 ○ Send09.jsp		(반복문을 쓰면 정적인 페이지로 못하니까 jsp로 생성)
	    Receive09.jsp
-->

<div>
	<h1>데이터 송수신 실습09</h1>
	<hr>
</div>

<div>
	<h2>구구단 선택</h2>
	<%=result %>
</div>


</body>
</html>