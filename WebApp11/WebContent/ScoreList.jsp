<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 :";
	
	try 
	{dao = new ScoreDAO();
	   
	   memberCount += dao.count() + "명</span>";
	   
	   str.append("<table class='table'>");
	   str.append("<th>번호</th><th>이름</th>"
	   	+ "<th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th></tr>");
	   
	
	   for(ScoreDTO score : dao.lists())
	   {
	      str.append("<tr>");
	      str.append("<td>" + score.getSid() + "</td>");
	      str.append("<td>" + score.getName() + "</td>");
	      str.append("<td>" + score.getKor() + "</td>");
	      str.append("<td>" + score.getEng() + "</td>");
	      str.append("<td>" + score.getMat() + "</td>");
	      str.append("<td>" + score.getTot() + "</td>");
	      str.append("<td>" + score.getAvg() + "</td>");
	      str.append("</tr>");
	   }
	   str.append("</table>");
	}
	catch(Exception e)
	{
	   System.out.println(e.toString());
	}
	finally
	{
	   try
	   {
	      dao.close();
	   }
	   catch(Exception e)
	   {
	      System.out.println(e.toString());
	   }
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.errMsg { display: none; }
</style>
<script type="text/javascript">

	function formCheck()
	{
		//test
		//alert("a");
		var uName = document.getElementById("userName");
		var uKor = document.getElementById("scoreKor");
		var uEng = document.getElementById("scoreEng");
		var uMat = document.getElementById("scoreMat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("scoreKor");
		var engMsg = document.getElementById("scoreEng");
		var matMsg = document.getElementById("scoreMat");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if(uName.value == "") 
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		if(uKor.value == "" || isNaN(uKor.value) || Number(uKor.value)<0 || Number(uKor.value)>100)
		{
			korMsg.style.display = "inline";
			uKor.focus();
			return false;
		}
		if(uEng.value == "" || isNaN(uEng.value) || Number(uEng.value)<0 || Number(uEng.value)>100)
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
		if(uMat.value == "" || isNaN(uMat.value) || Number(uKor.value)<0 || Number(uMat.value)>100)
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

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<h3>성적처리</h3>
	<form action="ScoreInsert.jsp" onsubmit="return formCheck()">
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
	<div class="div01">
   		<%=memberCount %>
   		<%=str.toString() %>
    </div>
</div>

</body>
</html>