<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String result = (String)request.getAttribute("result");
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
	<h1>서블릿에서 데이터 흐름</h1>
	<hr />
</div>

<div>
	<h1>최종 결과값 수신</h1>
	<hr />
</div>

<div>
	<h3><%=result %></h3>
</div>

</body>
</html>