<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String UserName = (String) session.getAttribute("UserName");
	String UserTel = (String) session.getAttribute("UserTel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{
		//test
		//alert("a");
		
		var f = document.idForm;
		
		if (!f.inputId.value)
		{
			alert("아이디를 입력하세요.");
			f.inputId.focus();
			return;
		} 
		else if(!f.inputPwd.value)
		{
			alert("비밀번호를 입력하세요.");
			f.inputPwd.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>

<div>
	<h1>세션 처리 - 아이디, 패스워드 입력</h1>
	<hr />
</div>

<div>
	<form action="TestSession03.jsp" method="post" name="idForm">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="txt" name="inputId" id="inputId">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" class="txt" name="inputPwd" id="inputPwd">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn" id="inputBtn" name="inputBtn" value="입력하기" onclick="sendIt()">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>