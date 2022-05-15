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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			// date 구성
			var params = "name=" + $.trim($("#name").val()) 
						+ "&content=" + $.trim($("#content").val());
			
			/*
			$.ajax(
			{
				type: "POST"
				, url:"AjaxTest02_ok.jsp"
				, data :params
				, async: true		//-- 비동기
				, dataType:"xml"	//--check~
				, success:동작
				, beforeSend:true
				, error: 동작
			});
			*/
			$.ajax(
			{
				type: "POST"
				, url:"AjaxTest02_ok.jsp"
				, data :params
				, async: true		//-- 비동기
				, dataType:"xml"	//--check~
				, success:function(args)
				{
					var out = "";
					out = ">> 게시물 갯수 : " + $(args).find("total_dataCount").text() + "<br>";
					
					$(args).find("comment").each(function()
					{
						var item = $(this);
						var num = item.attr("num");
						var name = item.find("name").text();
						var content = item.find("content").text();
						
						out += "<br>========================";
						out += "<br> 번호 : " + num;
						out += "<br> 이름 : " + name;
						out += "<br> 내용 : " + content;
						out += "<br>======================<br>";
					});
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend:showRequest
				, error: function(e)
				{
					alert(e.responseText);	// (클라이언트 쪽에서 보기)
					console.log(e);			// (서버 쪽에서 보기)
				}
			});
		});
	});
	
	function showRequest(xhr)
	{
		var flag = true;
		
		if(!$.trim($("#name").val()))	// 띄어쓰기도 입력 안한 것으로 처리하기 위해 trim 처리
		{
			alert("이름을 입력해라");
			$("#name").focus();
			flag = false;
		}
		if(!$.trim($("#content").val()))
		{
			alert("내용을 입력해라");
			$("#content").focus();
			flag = false;
		}
		
		return flag;
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