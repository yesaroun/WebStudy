<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String UserName = (String) session.getAttribute("UserName");
	String UserTel = (String) session.getAttribute("UserTel");
	String UserId = request.getParameter("UserId");
	String UserPwd = request.getParameter("UserPwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<%=UserName %>
<br />
<%=UserTel %>
<br />
<%=UserId %>
<br />
<%=UserPwd %>
<br />
</body>
</html>