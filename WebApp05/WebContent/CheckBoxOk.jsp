<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String nameStr = request.getParameter("name");
	String memoStr = request.getParameter("memo");
	
	String[] loverArr = request.getParameterValues("checkGroup");
	
	String lover = "";
	
	String hobby = "";
	if (loverArr != null)
	{
		for (String item : loverArr)
			lover += " [" + item + "]";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
<link rel="stylesheet" type="txt/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp ○ → CheckBoxOk.jsp ● </p>
</div>

<div>
	<h2>수신 데이터 확인</h2>
	
	<h3>이름 : <%=nameStr %></h3>
	
	<h3>메모</h3>
	<p><%=memoStr %></p>
	
	<h3>이상형 : <%=lover %></h3>
</div>

</body>
</html>