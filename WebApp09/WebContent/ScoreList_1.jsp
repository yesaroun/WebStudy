<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "";
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 → 리스트를 조회하기 위한 select 쿼리문
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 구성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// 테이블 구성
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th>번호</th><th>이름</th>";
	str += "<th>국어점수</th><th>영어점수</th><th>수학점수</th>";
	str += "<th>총점</th><th>평균</th>";
	str += "</tr>";
	
	// ResultSet 에 대한 처리 → 반복문 구성
	while(rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td class='score'>" + rs.getString("KOR") + "</td>";
		str += "<td class='score'>" + rs.getString("ENG") + "</td>";
		str += "<td class='score'>" + rs.getString("MAT") + "</td>";
		str += "<td class='score'>" + rs.getString("TOT") + "</td>";
		str += "<td class='score'>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.score {text-align: center;}
	.errMsg { color: red; font-size: small; display: none; }
</style>
<script type="text/javascript">
	function formCheck() 
	{	
		var uName = document.getElementById("userName");
		var uKor = document.getElementById("kor");
		var uEng = document.getElementById("eng");
		var uMat = document.getElementById("mat");
	
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
	
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
	
		if (uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return false;
		}
	
		if (uKor.value == "" || isNaN(uKor.value) || Number(uKor.value)<0 || Number(uKor.value)>100)
		{
			korMsg.style.display = "inline";
			uKor.focus();
			return false;
		}
	
		if (uEng.value == "" || isNaN(uEng.value) || Number(uEng.value)<0 || Number(uEng.value)>100)
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
	
		if (uMat.value == "" || isNaN(uMat.value) || Number(uMat.value)<0 || Number(uMat.value)>100)
		{
			matMsg.style.display = "inline";
			uMat.focus();
			return false;
		}
	
		return true;
	}
</script>
</head>
<body>

<!-- 
	○ WebApp09
	
	- 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	  총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
	- 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	- 데이터베이스 연동하여 처리한다.
	  (TBL_SCORE, SCORESEQ 활용)
	- 즉, 성정 처리 프로그램을 데이터베이스 연동하여
	  JSP로 구성할 수 있도록 한다.
	  
	  데이터베이스 연결 및 데이터 처리
	  ------------------------------------------------------------
	  성적 처리
	  
	  이름(*)		[ textbox ] → 이름 입력 확인
	  국어점수		[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
	  영어점수		[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
	  수학점수		[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
	  
	  < 성적 추가 >				→ button
	  
	  번호		이름	국어점수  영어점수  수학점수	총점	평균
	  1       이시우	      90	   80	      70	 xxx	xx.x
	  2       이윤태	      80	   70	      60	 xxx	xx.x
	  3       홍은혜	      70	   60	      70	 xxx	xx.x
	  
	  ○ WebApp09_scott.sql
	  	 ScoreList.jsp
	  	 ScoreInsert.jsp
	  	 com.util.DBConn.java
-->

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<h3>성적 처리</h3>
	
	<form action="ScoreInsert_1.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<th>
					<input type="text" class="txt" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</th>
			</tr>
			<tr>
				<th>국어점수</th>
				<th>
					<input type="text" class="score" id="kor" name="kor"/>
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
				</th>
			</tr>
			<tr>
				<th>영어점수</th>
				<th>
					<input type="text" class="score" id="eng" name="eng"/>
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
				</th>
			</tr>
			<tr>
				<th>수학점수</th>
				<th>
					<input type="text" class="score" id="mat" name="mat"/>
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
				</th>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="성적추가" class="btn" >
				</td>
			</tr>
		</table>
	</form>
	
	<div class="div01">
		<%=str %>
	</div>
</div>
</body>
</html>














