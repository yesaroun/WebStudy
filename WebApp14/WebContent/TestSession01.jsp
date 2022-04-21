<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{
		//test
		//alert("a");
		
		var f = document.nameForm;
		
		if (!f.inputName.value)
		{
			alert("이름을 입력하세요.");
			f.inputName.focus();
			return;
		} 
		else if(!f.inputTel.value)
		{
			alert("전화번호를 입력하세요.");
			f.inputTel.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>

<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp 로
	   이름과 전화번호를 입력받아 전송
	   
	   TestSession02.jsp 에서 TestSession03.jsp로 
	   아이디와 패스워드를 입력받고
	   앞에서 전달받은 이름과 전화번호를 함께 전송
	   
	   TestSession03.jsp 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
	   
	   01→→→→→→→→→02→→→→→→→→→03
	   이름, 전화	아이디, 패스워드	이름, 전화번호, 아이디 패스워드
	   입력				입력				출력
	   
	   				- getParameter			- getAttribute
-->

<div>
	<h1>세션 처리 - 이름, 전화번호 입력</h1>
	<hr />
</div>

<div>
	<form action="TestSession01_1.jsp" method="post" name="nameForm">
		<table>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" class="txt" name="inputName" id="inputName">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" class="txt" name="inputTel" id="inputTel">
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