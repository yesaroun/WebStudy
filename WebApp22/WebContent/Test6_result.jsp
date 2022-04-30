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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) forEach문을 이요한 자료구조 활용 실습</h1>
	<hr />
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		
		<!-- 컬렉션 객체 접근용(출령용) 반복문 구성(컬랙션을 구성할때는 items 속성 먼저 쓰기, 향상된 for문과 비슷) -->
		<%-- <c:forEach var="변수" items="컬렉션"></c:forEach> --%>
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td style="text-align: center;">${dto.name }</td>
			<td style="text-align: center;">${dto.age }</td>
		</tr>
		
		</c:forEach>
		
	</table>
</div>

</body>
</html>