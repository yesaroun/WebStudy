<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");

	Calendar cal = Calendar.getInstance();

	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 이번달 날짜 세팅
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	int selectDay = 1;
	
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 이전달
	int preMonth = selectMonth - 1;
	int preYear = 0;
	
	if(preMonth < 1)
	{
		preYear = selectYear - 1;
		preMonth = 12;
	}
	else 
		preYear = selectYear;
	
	// 다음달
	int nextMonth = selectMonth + 1;
	int nextYear = 0;
	
	if(nextMonth > 12)
	{
		nextYear = selectYear + 1;
		nextMonth = 1;
	}
	else
		nextYear = selectYear;
	
	
	// 달력 세팅
	cal.set(Calendar.YEAR, selectYear);
	cal.set(Calendar.MONTH, selectMonth-1);
	cal.set(Calendar.DATE, selectDay);
	
	//마지막날
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	// 요일
	int week = cal.get(Calendar.DAY_OF_WEEK);
	
	
	// 달력 테이블 그리기------------------------------
	String calStr = "";
	
	//요일 출력
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	calStr += "<table border='1'>";
	calStr += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		if(i==0)									
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)								
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else										
			calStr += "<th>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	// 공백 출력
	calStr += "<tr>";
	for (int i=1; i<week; i++)
		calStr += "<td></td>";
	
	// 날짜 출력
	for(int i=1; i<=endDay; i++)
	{
		if(selectYear==nowYear && selectMonth == nowMonth && i==nowDay && week%7==0) 
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth == nowMonth && i==nowDay && week%7==1) 
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth == nowMonth && i==nowDay)		
			calStr += "<td class='now'>" + i + "</td>";
		else if (week%7==0)															
			calStr += "<td class='sat'>" + i + "</td>";
		else if (week%7==1)															
			calStr += "<td class= 'sun'>" + i + "</td>";
		else																		
			calStr += "<td>" + i + "</td>";
		
		if(week%7 == 0)
			calStr += "</tr><tr>";
		
		week++;
	}
	week--;
	
	// 뒤에 공백 출력
	for (int i=0 ; i<=week; i++, week++)
	{
		if (week%7==0)
			break;
		calStr += "<td></td>";
	}
	
	calStr += "</tr>";
	
	// 달력 테이블 끝
	calStr+= "</table>";
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
</script>
<style type="text/css">
	td {text-align: right;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
	#none {display: none}
</style>
</head>
<body> 

<!-- 
	○ 데이터 송수신 실습 08
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지를 구성한다.
	   
	     ◀ 2022년 4월 ▶
	     -----------------------------
	     -----------------------------
	     -----------------------------
	     -----------------------------
	   
	   - 『◀』 이나 『▶』 클릭 시
	      해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
	   
	   - 사용자 최초 요청 주소는
	     http://localhost:8090/WebApp07/SendAndReceive08.jsp로 한다.
	 
	 ○ SendAndReceive08.jsp
-->

<div>
	<h1>데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<form action="" method="get">
		<a href="SendAndReceive08.jsp?year=<%=preYear %>&month=<%=preMonth %>">◀</a>
		<!-- <span>◀</span> -->
		<b><%=selectYear %> 년 <%=selectMonth %> 월</b>
		<!-- <span>▶</span> -->
		<a href="SendAndReceive08.jsp?year=<%=nextYear %>&month=<%=nextMonth %>">▶</a>
		<div id="none">
			<input type="text" id="year" name="year" class="txt">
			<input type="text" id="month" name="month" class="txt">
		</div>
	</form>
</div>

<div>
	<%=calStr %>
</div>

</body>
</html>
