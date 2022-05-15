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
<title>AjaxTest03.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "title=" + $.trim($("#title").val())
				+ "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				/* 내 풀이
				type : "POST"
				, url : "AjaxTest03_ok.jsp"
				, data : params
				, dataType : "xml"
				, success : function(args)
				{
					var out = "";
					out = ">> 게시물 갯수 : " + $(args).find("total_dataCount").text() + "<br>";
					
					$(args).find("comment").each(function()
					{
						var item = $(this);
						var num = item.attr("num");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						out += "<br> >> id=" + num;
						out += "<br> - title : " + title;
						out += "<br> - content : " + content;
						out += "<br><br>";
					});
					$("#resultDiv").html(out);
					
					$("#title").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforSend : showRequest
				, error : function(e)
				{
					alert(e.responseText);
				}
				*/
				type : "POST"
				, url : "AjaxTest03_ok.jsp"
				, data : params
				, dataType : "xml"
				, success : function(xml)
				{
					$(xml).find("status").each(function()
					{
						var status = $(this).text();
						//alert(status);					// 확인
					});
					
					var str = "";
					
					$(xml).find("records").each(function()
					{
						var records = $(this);
						var id = records.attr("id");
						var title = $(this).find("title").text();
						var content = $(this).find("content").text();
						
						str += ">> id=" + id + "<br>- title=" + title
							+ "<br>- content=" + content + "<br><br>";
					});
					
					$("#resultDiv").html(str);
				}
				, beforeSend:showRequest
				, error : function(e)
				{
					alert(e.responseText);
				}
			});
		});
	});
	
	function showRequest()
	{
		var flag = true;
		
		if (!$.trim($("#title").val()))  
	    {
	        alert("제목을 입력해야 합니다.");
	        $("#title").focus();
	        flag = false;
	    }
	      
	    if (!$.trim($("#content").val()))
	    {
	        alert("내용을 입력해야 합니다.");
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
	제목 <input type="text" id="title" class="txt"><br>
	내용 <input type="text" id="content" class="txt"><br>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn" class="btn">
</div>

<div id="resultDiv">
</div>
<!-- 
>> id=1
- title=테스트
- content=반갑습티다

>> id=2
- title=테스트
- content=반갑습티다
-->
</body>
</html>