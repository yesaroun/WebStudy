<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//Send03.html 페이지로부터 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	int num1, num2;
	num1=num2=0;
	String result = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if (op.equals("+"))
			result = String.valueOf(num1 + num2);
		else if (op.equals("-"))
			result = String.valueOf(num1 - num2);
		else if (op.equals("*"))
			result = String.valueOf(num1 * num2);
		else if (op.equals("/"))
			// result = String.valueOf(num1 / num2);
			// result = String.valueOf(num1 / (double)num2);
			result = String.format("%.1f", num1 / (double)num2); 
			
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
</head>
<body>

<div>
	<h2>연산 확인</h2>
	입력하신 <span><%= num1%></span>와(과) 
	<span><%= num2%></span>의 연산 결과는 
	<span><%=result %></span> 입니다.<br>
</div>

</body>
</html>