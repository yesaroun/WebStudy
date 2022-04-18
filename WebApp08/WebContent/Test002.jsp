<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수
	String str = "";

	// 데이터 베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(select (출력 먼저하려고 해서))
	String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 → 반복문 처리
	str += "<table>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='telTitle'>전화번호</th>";
	str += "</tr>";
	
	while (rs.next())
	{
		str += "<tr>";
		str += "<td class='list'>" + rs.getString("SID") + "</td>";
		str += "<td class='list'>" + rs.getString("NAME") + "</td>";
		str += "<td class='list'>" + rs.getString("TEL") + "</td>";
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
<title>Test002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	input {width: 200px}
	button {width: 210px; height: 50px; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
	#numTitle {width: 50px;}
	#nameTitle {width: 100px;}
	#telTitle {width: 160px}
	.list {text-align: center;}
</style>
<script type="text/javascript">

	// 필수 입력 항목에 대한 기본적인 확인
	function formCheck()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		var uName = document.getElementById("userName");
		var nErr = document.getElementById("nameErr");
		
		nErr.style.display = "none";
		
		if(uName.value == "")
		{
			nErr.style.display = "inline";
			return false;
		}
		
		return true;		// (false는 페이지 안넘어가고 true면 페이지 요청함)
	}
	
</script>
</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr />
</div>

<div>
	<!-- 데이터 입력 -->
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td><input type="text" id="userName" class="txt" />
					<span id="nameErr" class="errMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" class="txt" id="userTel" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button id="btnAdd" type="submit" class="btn control">데이터 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br /><br />

<div>
	<!-- 처리 결과 -->
	<%=str %>
</div>


</body>
</html>