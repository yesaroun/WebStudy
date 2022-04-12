<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	String strNum = request.getParameter("dan");
	int num = 0;
	String result = "";
	int numResult = 0;
	
	try 
	{
		num = Integer.parseInt(strNum);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	for(int i=1; i<10; i++) 
	{
		numResult = num * i;
		result += num + " X " + i + " = " + numResult + System.lineSeparator();
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GugudanOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css"> 
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp ○ → GugudanOk.jsp ● </p>
</div>

<div>
	<h2>결과</h2>
	<p>
		<%=result %>
	</p>
</div>

</body>
</html>