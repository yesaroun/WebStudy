<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>서블릿에서 데이터 흐름</h1>
	<hr />
</div>

<div>
	<form action="<%=cp%>/test2" method="post">
		이름 <input type="text" class="txt" name="name"/>
		나이 <input type="text" class="txt" name="age"/>
		<button class="btn" type="submit">확인</button>
	</form>
</div>

</body>
</html>