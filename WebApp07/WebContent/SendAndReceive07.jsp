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
	// 먼저 구성해보기
	// ----------------------------------------확인한 날짜로 월 select option 구성
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
		// 유혀성 검사가 필요한 경우 삽입할 수 있는 영역~!!!
		
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
			<option value="99">99</option> 
			<option value="98">98</option> 
		</select> 월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
</div>







</body>
</html>