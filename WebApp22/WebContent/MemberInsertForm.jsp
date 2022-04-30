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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>css/main.css">
</head>
<body>

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr />
</div>

<div>
	<form action="MemberInsert.jsp">
	
		<!-- (이름, 전화번호, 주소) * 5명 분 -->
		<!-- submit 액션 처리 -->
		<table class="table">
			<tr>
				<th>이름</th>
				<c:forEach var="a" begin="1" end="5" step="1">
					<td>
						<input type="text" name="name${a }">
						<c:set var="i" value="${i+1 }"></c:set>
					</td>
				</c:forEach>
				<!-- <td>
					<input type="text" name="name1">
					<input type="text" name="name2">
					<input type="text" name="name3">
					<input type="text" name="name4">
					<input type="text" name="name5"> 
				</td> -->
			</tr>
			<tr>
				<th>전화번호</th>
				<c:forEach var="a" begin="1" end="5" step="1">
					<td>
						<input type="text" name="tel${a }">
						<c:set var="i" value="${i+1 }"></c:set>
					</td>
				</c:forEach>
				<!-- <td>	
					<input type="text" name"tel1">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
				</td> -->
			</tr>
			<tr>
				<th>주소</th>
				<c:forEach var="a" begin="1" end="5" step="1">
					<td>
						<input type="text" name="addr${a }">
						<c:set var="i" value="${i+1 }"></c:set>
					</td>
				</c:forEach>
				<!-- <td>
					<input type="text" name="addr1">
					<input type="text">
					<input type="text">
					<input type="text">
					<input type="text">
				</td> -->
			</tr>
			<tr>
				<td>
					<button type="submit" style="width: 100%">입력</button>
				</td>
					
			</tr>
		</table>
	</form>
</div>

</body>
</html>