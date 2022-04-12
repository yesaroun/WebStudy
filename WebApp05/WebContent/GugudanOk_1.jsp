<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로(Gugudan.jsp)부터 데이터 수신 → dan
	
	String danStr = request.getParameter("dan");

	int n = 0;
	
	try
	{
		n = Integer.parseInt(danStr);
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
<title>GugudanOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp ○ → GugudanOk.jsp ● </p>
</div>

<!-- html 주석문 -->
<%-- jsp 주석문(서블릿 컨테이너에게 안보이는 주석문(html소스코드에서 안보임)) --%> 

<%-- 
<%
	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
	}
%> 
--%>

<%
	for(int i=1; i<=9; i++)
	{
%>
	<%=n %> * <%=i %> = <%=(n*1) %> <br>
<%
	} // 이렇게도 가능
%>

</body>
</html>