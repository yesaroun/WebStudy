<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession02.jsp)로부터 데이터(userId, userPwd) 수신
	/* String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel"); */
	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	session.removeAttribute("userName");
	session.removeAttribute("userId");
	session.removeAttribute("userBirth");
	session.removeAttribute("userPwd"); // (지워도 상관없음. 이미 값을 담아놨기 때문에)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h2>이름, 전화번호, 아이디, 패스워드 출력</h2>
	<h3>(TestSession03.jsp)</h3>
</div>

<div>
	<h2>이름 : <%=userName%> </h2>
	<h2>생일 : <%=userTel%> </h2>
	<h2>아이디 : <%=userId%> </h2>
	<h2>비밀번호 : <%=userPwd%> </h2>
</div>

</body>
</html>