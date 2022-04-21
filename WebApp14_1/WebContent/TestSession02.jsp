<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//데이터 수신 (TestSession01.jsp 페이지로부터...)
	// → userName, userTel
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	// check~!!!
	// 추가~!!!
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);
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
		// 확인
		//alert("a");
		
		var f = document.forms[0];
		
		if(!f.userId.value)
		{
			alert("아이디 입력~!!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드 입력~!!!");
			f.userPwd.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>

<div>
	<h1>아이디와 패스워드(TestSession02.jsp)</h1>
	<hr />
</div>

<div>
	<form action="TestSession03.jsp" method="post">
		<table>
			<tr>
				<th>아이디</th>	
				<td>
					<input type="text" name="userId" style="width: 100px;">
				</td>
			</tr>
			 <tr>
                 <th>패스워드</th>
                 <td>   
                     <input type="text" name="userPwd" style="width: 100px;">
                 </td>
            </tr>
             <tr>
                  <th colspan="2">
                      <button type="button" style="width: 400px; height: 40px; font-size: 17pt;"
                      onclick="sendIt()">다음 페이지로 전송</button>
                  </th>
             </tr>
		</table>
	</form>
</div>

</body>
</html>