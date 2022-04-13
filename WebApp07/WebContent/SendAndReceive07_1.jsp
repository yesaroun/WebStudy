<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	int selectY = nowYear;
	int selectM = nowMonth;
	
	if (yearStr != null || monthStr != null)
	{
		selectY = Integer.parseInt(yearStr);
		selectM = Integer.parseInt(monthStr);
	}
	
	String yOptions = "";
	for(int year=(selectY=10); year<=(selectY+10); year++)
	{
		if(yearStr==null && year==nowYear)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else if (yearStr != null && year==Integer.parseInt(yearStr))
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else
		{
			yOptions += "<option value='" + year + "'>" + year + "</option";
		}
	}
	
	String mOptions = "";
	for (int month=1; month<=12; month++)
	{
		if(monthStr==null && month==nowMonth)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else if(monthStr!=null && month==Integer.parseInt(monthStr))
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value='" + month + "'>" + month + "</option>";
			
	}
	
	
	
	int[] month = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if(selectY%4==0 && selectY%100!=0 || selectY%400==0)
	{
		month[1] = 29;
	}
	
	int nalsu;
	
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	nalsu = (selectY-1)*365 + ((selectY-1)/4) - ((selectY-1)/100) + ((selectY-1)/400);
	
	for(int i=0; i<selectM-1; i++)
	{
		nalsu += month[i];
	}
	nalsu++;
	
	int week = nalsu%7;
	int lastDay = month[selectM - 1];
	
	String calStr="";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	for (int i=0; i<weekName.length; i++)
	{
		if(i==0)
			calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
		else if(i == 6)
			calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
		else
			calStr += "<th>" + weekName[i] + "</th>";
	}
	calStr += "</tr>";
	
	calStr += "<tr>";
	
	for(int i=1; i<=week; i++)
		calStr += "<td></td>";
	
	for(int i=1; i<=lastDay; i++)
	{
		week++;
		
		if(selectY==nowYear && selectM==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if(selectY==nowYear && selectM==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectY==nowYear && selectM==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
			
		if(week%7==0)
			calStr += "</tr><tr>";
	}
	
	for (int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		calStr += "<td></td>";
	}
	if(week%7 != 0)
		calStr += "</tr>";
		
	calStr += "</table>";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<style type="text/css">
	td {text-align: right;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>
<script type="text/javascript">
function formCalendar(obj)		// obj 는 form 객체
{
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
	   - 월 구성은 1월부터 12월 까지로 구성한다.
	   
	   	 [ 2022 ▼] 년 [ 4 ▼ ] 월
	   	 
	   	 -------------------------------------
	   	 -------------------------------------
	   	 -------------------------------------
	   	 -------------------------------------
	   	 
	   - 연도 select 나 월 select 의 내용이 변화되면
	     해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	   
	   - 사용자 최초 오청 주소는
	     http://localhost:8090/WebApp07/SendAndReceive07.jsp 로 한다.
	     
	 ○ SendAndReceive07.jsp
	 	 
-->

<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div>
<!--  form 의 action 속성 값 생략 → 요청 페이지/ 데이터 수신처는 자기 자신 -->
	<form action="" method="post">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<%=yOptions %>
		</select>년
		<select id="month" name="month" onChange="formCalendar(this.form)">
			<%=mOptions%>
		</select> 월
	</form>
</div>
<br><br>

<div>
	<%=yearStr %>년 <%=monthStr %>월
	<%=calStr %>
</div>


</body>
</html>