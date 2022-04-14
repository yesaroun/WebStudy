<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 자기 자신 페이지로부터 데이터 수신
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");

	// Calendar 객체 생성
	// java.util.Calendar cal = java.util.Calendar.getInstacne();
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);				//-- 2022
	int nowMonth = cal.get(Calendar.MONTH) + 1;			//-- 4
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);		//-- 13
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우
	//→ Line 5 ~ 6 을 통해 수신한 데이터로 표시할 달력의 년, 월 구성
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 테스트
	//out.print("<h1>selectYear : " + selectYear + "</h1>");
	//out.print("<h1>selectMOnht : " + selectMonth + "</h1>");
	
	// 확인한 날짜로 년도 select option 구성----------------------------------------
	// <option value="2012">2012</option>
	// <option value="2013">2013</option>
	// 					:
	// <option value="2022" selected="selected">2022</option>
	// 					:
	// <option value="2031">2031</option>
	// <option value="2032">2032</option>
	
	String yOptions = "";
	for(int year=(selectYear-10); year<=(selectYear+10); year++)		// 2012 ~ 2032
	{
		// 관찰1
		//yOptions += "<option value='" + year +"'>" + year + "</option>";
		
		// 관찰2
		//if(year==nowYear)
		//	yOptions += "<option value='" + year +"' selected='selected'>" + year + "</option>";
		//else
		//	yOptions += "<option value='" + year +"'>" + year + "</option>";
		
		// 상황1. 페이지 최초 요청일 때 → sYear 는 null / 현재 년도와 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청 아닐 때 → sYear 는 null 아님 / 선택된 년도와 옵션이 같을 때 → selected(○)
		// 상황3. 나머지 → selected(X)
		if (sYear==null && year==nowYear)
			yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
		else if (sYear!=null && Integer.parseInt(sYear)==year)
			yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
		else 
			yOptions += "<option value='" + year +"'>" + year + "</option>";
	}
	
	// ----------------------------------------확인한 날짜로 년도 select option 구성

	// 확인한 날짜로 월 select option 구성----------------------------------------
	// <option value="1">1</option>
	// <option value="2">2</option>
	// 					:
	// <option value="4" selected="selected">4</option>
	// 					:
	// <option value="11">11</option>
	// <option value="12">12</option>
	
	String mOptions = "";
	
	for (int month=1; month<=12; month++)
	{
		// 상황1. 페이지 최초 요청일 때 → sMonth 는 null / 현재 월과 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청 아닐 때 → sMonth 는 null 아님 / 선택된 월과 옵션이 같을 때 → selected(○)
		// 상황3. 나머지 → selected(X)
		if(sMonth==null && month==nowMonth)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else if(sMonth!=null && Integer.parseInt(sMonth)==month)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value='" + month + "'>" + month + "</options>";
	}
	// ----------------------------------------확인한 날짜로 월 select option 구성
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요-----------------------------
	// (만년달력)
	
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1] = 29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 현재 년도 → 입력받은 년도 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 월의 이전 월까지의 날 수 추가
	for(int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	
	nalsu++;		// + 1
	
	int week = nalsu%7;						//-- 요일 변수
	int lastDay = months[selectMonth-1];	//-- 마지막 날짜 변수
	

	// 달력  그리기---------------------------------------------------------------
	String calStr = "";
	calStr += "<table border='1'>";
	
	// 요일 이름 발생
	calStr += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		if(i==0)									// 일요일
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)								// 토요일
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else										// 평일
			calStr += "<th>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	for (int i=1; i<=week; i++)
		calStr += "<td></td>";
	
	// 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{
		week++;								//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다) 요일도 함께 1씩 증가~!!!	check~!!!
		
		//calStr += "<td>" + i + "</td>";
		
		if(selectYear==nowYear && selectMonth == nowMonth && i==nowDay && week%7==0) //-- 토요일인 오늘
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth == nowMonth && i==nowDay && week%7==1) //-- 일요일인 오늘
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth == nowMonth && i==nowDay)		//-- 평일인 오늘
			calStr += "<td class='now'>" + i + "</td>";
		else if (week%7==0)															//-- 오늘이 아닌 토요일
			calStr += "<td class='sat'>" + i + "</td>";
		else if (week%7==1)															//-- 오늘이 아닌 일요일
			calStr += "<td class= 'sun'>" + i + "</td>";
		else																		//-- 오늘이 아닌 평일
			calStr += "<td>" + i + "</td>";
			
		if(week%7 == 0)
			calStr += "</tr><tr>";
	}
	
	// 빈칸 공백 td 발생
	for (int i=0 ; i<=week; i++, week++)
	{
		if (week%7==0)
			break;
		calStr += "<td></td>";
	}
	
	if (week%7!=0)
		calStr += "</tr>";
	
	calStr += "</table>";
	
	// ---------------------------------------------------------------달력  그리기

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>
<script type="text/javascript">
	function formCalendar(obj)
	{
		// 유효성 검사가 필요한 경우 삽입할 수 있는 영역~!!!
		
		obj.submit();
	}
</script>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 구성은 현재의 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	     (기본적으로 만년달력을 구성하는데 현재의 연, 월 은 달력 객체로부터 확인할 수 있도록 한다.)
	   - 월 구성은 1월 부터 12월 까지로 구성한다.
	   
	       2012
	         :
	     [ 2022 ▼] 년  [ 4 ▼] 월
	         :
	       2032  
	     
	     -----------------------------
	     -----------------------------
	     -----------------------------
	     -----------------------------
	     
	  - 연도 select 나 월 select 의 내용이 변화되면
	    해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	    
	  - 사용자 최초 요청 주소는
	    http://localhost:8090/WebApp07/SendAndReceive07.jsp 로 한다.
	    
	○ SendAndReceive07.jsp	         

-->


<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>


<div>
	<!-- form 의 action 속성 값 생략 → 요청 페이지 / 데이터의 수신처는 자기 자신 -->
	<form action="" method="post">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<!-- <option value="9999">9999</option> -->
			<%=yOptions %>
		</select> 년
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<!-- <option value="99">99</option>  -->
			<%=mOptions %>
		</select> 월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>


</body>
</html>