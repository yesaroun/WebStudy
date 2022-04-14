<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewFile.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<br>
</div>

<!-- Send10.jsp → Send10_re.jsp	→ Receive10.jsp  -->
<!-- Send10.jsp → Send10_for.jsp	→ Receive10.jsp  -->

<!-- 사용자 최초 요처어 페이지 -->
<!-- http://localhost:8090/WebApp07/Send10.jsp -->

<div>
	<h2>포워딩 및 리다이렉트</h2>
</div>

<div>
	<!-- action 처리에 대한 분기~!!! -->
	<form action="" method="post" id="testForm">
		이름 <input type="text" name="userName" class="txt">
		<br><br>
		
		<!-- check -->
		<button type="submit" class="btn" style="width: 150px"
		onclick="this.form.action='Send10_re.jsp'">리다이렉트</button> <!-- this.form.action='Send10_re.jsp' : 이 객체의 폼이 갖고 잇는 action 속성이 'Send10_re.jsp' 이거 요청 -->
		<button type="submit" class="btn" style="width: 150px"
		onclick="this.form.action='Send10_for.jsp'">포워드</button>
	</form>
</div>

</body>
</html>