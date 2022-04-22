<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>  <!-- scope="page" : scope 없으면 페이지 이다 임 -->
<jsp:setProperty property="*" name="ob"/>
<!-- set과 get 구분하기! 여기서는 이미 전 페이지에서 데이터를 다 받았음 16번 참고하기! -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 작성해서 넘긴 내용 확인 -->
<!-- 이름, 제목, 내용 -->

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div>
	<h2>작성된 내용 확인</h2>
	<h3>이름 : <%=ob.getUserName() %></h3>
	<h3>제목 : <%=ob.getSubject() %></h3>
	<h3>내용 : <%=ob.getContent().replaceAll("\n", "<br>") %></h3>	<!-- (testarea 할때는 문자열이니까 이거 필요)-->
</div>

</body>
</html>