<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(Sent09.jsp)부터 데이터(gugudan) 수신
	
	String gugudanStr = request.getParameter("gugudan");
	int gugudan = 0;
	String result = "";
	
	try
	{
		gugudan = Integer.parseInt(gugudanStr);
		for(int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", gugudan, i, gugudan*i);
		}
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09_1.jsp</title>
</head>
<body>

<div>
   <p>수신 데이터 : <%=gugudanStr %></p>
   <p><%=result %></p>
</div>

</body>
</html>