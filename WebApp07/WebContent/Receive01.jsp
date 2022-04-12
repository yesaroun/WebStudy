<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String num = request.getParameter("num");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>
</head>
<body>

<div>
	<h2>회원가입 완료</h2>
	<p>
		<%=name %>님, 회원가입이 완료되었습니다.
	</p>
	<p>
		회원님께서 등록하신 전화번호는 <%=num %>입니다.
	</p>
</div>

</body>
</html>