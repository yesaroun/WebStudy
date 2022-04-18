<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<h3>성적처리</h3>
	<form action="">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input class="txt" id="userName" type="text" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" class="txt" id="scoreKor" name="scoreKor"/>
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" class="txt" id="scoreEng" name="scoreEng" />
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" class="txt" id="scoreMat" name="scoreMat"/>
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="성적 추가" class="btn" />
				</td>
			</tr>
		</table>
	</form>
	<div>
		
	</div>
</div>

</body>
</html>