<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 스크립트 릿 영역 → 이전 페이지로부터 전송된 데이터 수신
	
	// 데이터 수신(스크립트 릿)
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	int n1 = 0;
	int n2 = 0;
	
	// 테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int n = 0;
	
	try 
	{
		// 수신된 데이터 형변환
		n1 = Integer.parseInt(s1);
		n2 = Integer.parseInt(s2);
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
<title>TableOk.jsp</title>
<link rel="stylesheet" type="txt/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp ○ → TableOk.jsp ●</p>
</div>


<div>
	<table border="1">
		<%
		for(int i=0;  i<n2; i++)
		{
		%>		
			<tr>
			<%
			for(int j=0; j<n1; j++)
			{
			%>
				<td style="width: 70px;">칸</td>
			<%
			}
			%>
			</tr>
		<%
		}
		%>
	</table>
</div>

</body>
</html>