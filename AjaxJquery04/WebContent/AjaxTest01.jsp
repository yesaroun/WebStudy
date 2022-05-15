<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			// date 구성
			var params = "name=" + $.trim($("#name").val()) 
						+ "&content=" + $.trim($("#content").val());
			
			// check~!!!
			// jQuery의 ajax() 함수 사용(호출)
			/*
			$.ajax(
			{
				type:"POST"
				, url:"AjaxTest01_ok.jsp"
				, data: params				// AjaxTest01_ok.jsp에서 수신하게 되는 데이터
				, success:동작				// 데이터 요청 및 전달이 성공했을 때 처리
				, beforeSend:반환값확인		// 요청 전 확인해야 할 항목 처리(true/false)
				, error:동작				// 처리 과정에서 문제가 발생 했을 때
			});
			*/
			
			$.ajax(
			{
				type:"POST"
				, url:"AjaxTest01_ok.jsp"
				, data: params				// AjaxTest01_ok.jsp에서 수신하게 되는 데이터
				, success:function(args)	// callBack. ajax 처리가 제대로 됐을 때~
				{
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend : showRequest // (전송 전에 리퀘스트 보여주기 true(제대로 됨) / false) check~
				, error : function(e)	// 에러 처리
				{
					alert(e.responseText);	// (에러 객체 responseText로 찍어보겠다.)
				}
			});
		});
	});
	
	function showRequest()
	{
		if (!$.trim($("#name").val()))	// 유효성 검사
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			return false;
		}
		return true;
	}

</script>
</head>
<body>

<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
	<hr />
</div>

<div>
	이름 : <input type="text" id="name" class="txt"><br>
	내용 : 
	<textarea rows="3" cols="50" id="content"></textarea>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn" class="btn">
</div>

<div id="resultDiv">
</div>

</body>
</html>