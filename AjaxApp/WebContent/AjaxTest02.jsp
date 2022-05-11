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
<style type="text/css">
	.short
	{
		width: 50px;
		text-align: right;	
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	function sum()
	{
		// 테스트
		//alert("함수 호출 확인");
		
		// 데이터 수집
		var n1 = document.getElementById("num1").value;
		var n2 = document.getElementById("num2").value;
		
		// URL 구성
		var url = "test02.do?n1=" + n1 + "&n2=" + n2;
		
		// XMLHttpRequest 객체 생성(→ AJAX 객체)
		ajax = createAjax();						//-- ajax.js
		
		// 『GET』 : 데이터 전송 및 페이지 요청 방식(POST 사용 가능. POST 사용 시 헤더 추가 필요)
		// 『url』 : AJAX 요청 페이지(데이터 수신 및 응답 페이지)
		// 『true』: boolean → true(비동기), false(동기). 동기는 사용 안함.		
		ajax.open("GET", url, true);
		//-- 실제 서버와의 연결이 아니고 일종의 환경 설정 부분으로 이해하는 것이 좋다.
		//   (실제 서버 연결은 나중에...)
		
		// ajax 객체(XMLHttpRequest 객체)의 readyState 속성은
		// 각 단계별로 변화되며, 0부터 4까지 순차적으로 증가한다.
		// 그 때 마다... 『readystatechage』 이벤트가 발생한다.
		ajax.onreadystatechange = function()
		{
			// 그 중에서... (0부터 4까지의 상태 중에서...)
			// 4 가 되는 순간이
			// 요청했던 서버로부터 응답이 완료된 시점이기 때문에
			// 4인 경우... 수행해야 할 업무를 진행한다.
			if (ajax.readyState == 4)
			{
				// 서버로부터 응답이 완료되었다 하더라도
				// 그 과정에서 데이터가 올바른 것인지 에러메세지를 받은 것인지
				// 알 수 없기 때문에 서버로부터 응답 받은 코드를 확인한 후
				// 업무를 진행할 수 있도록 처리(구성)한다.
				if (ajax.status == 200)
				{
					// 업무 진행
					 callBack();
				}
			}
		};
		
		// 실제 서버에서 AJAX 요청을 한다.(즉, 이 부분이 진짜 연결 작업이다.)
		// GET 방식으로 데이터를 전송하는 경우... 인자값이 ""
		// POST 방식으로 데이터를 전송하는 경우... 인자값에 데이터를 넣는다.
		// 현재는 GET 방식의 요청이다.(비워두는 것은 하지말자...)
		ajax.send("");
	}
	
	// 추출된 업무 코드
	//-- AJAX 요청이 완료된 후 호출되는 최종적인 업무 처리 함수
	function callBack() 
	{
		// 여기서는 두 가지 방법 중 하나로 데이터를 가져온다.
		
		// 1. 서버에서 응답한 데이터가 텍스트일 경우(주로 단일 데이터)
		var data = ajax.responseText;
		
		// 2. 서버에서 응답한 데이터가 XML일 경우(주로 다량의 데이터)
		//var data = ajax.responseXML;
		
		// 받아온 데이터를 업무에 적용한다.
		document.getElementById("result").value = data;
	}

</script>
</head>
<body>

<div>
	<h1>AJAX 기본 실습</h1>
	<hr />
</div>

<input type="text" id="num1" class="short" />
+
<input type="text" id="num2" class="short" />
<input type="button" value=" = " onclick="sum()"/>
<input type="text" id="result" class="short" />

<br /><br />

<h2>같은 페이지에 있는 기타 다른 요소들</h2>

<input type="text" /><br />

<input type="checkbox" name="check" value="check1" />체크1
<input type="checkbox" name="check" value="check2" />체크2
<br />

<input type="radio" name="rdo" value="rdo1" />라디오1
<input type="radio" name="rdo" value="rdo2" />라디오2
<br />

<select id="sel">
   <option value="1">선택1</option>
   <option value="2">선택2</option>
   <option value="3">선택3</option>
</select>

</body>
</html>

<!-- 
최초 요청은 /test02Send.do (web.xml에서 요청 url)에서!!
여기서 요청이 들어오면 web.xml에서는 어 요청이 들어왔네 com.test.svt.Test02Send로 안내
com.test.svt.Test02Send에서 AjaxTest02.jsp 너 출동해 하면
AjaxTest02.jsp가 등장

여기서 사용자가 = 클릭 버튼 누르면 sum()라는 스크립트 함수 호출
다른거 필요없이 숫자 입력한 것만 데려온다. (sum()에 있는) num1, num2 

그리고 요청 url에 내가 보내야할 데이터 다 삽입 
var url = "test02.do?n1=" + n1 + "&n2=" + n2;

그 다음에 비동기 방식으로 open 메소드 사용해서 get방식으로 설정 한다.

그리고 ajax 라는 이름으로 우리가 만들어둔 createAjax 호출 -> 여기서 하는 일은 xmlhttprequest (ajax)객체 얻어냄.

이 객체를 얻어내는 과정에서 사용자의 브라우저를 우리가 알 수 없으니
xmlRequest 지원하는지 안하는지 분기 처리해서 객체 생성 해줌 
(만약 아무것도 아니면 객체 못 얻어낸다. null)

이렇게 얻어낸 ajax 객체의 open 메소드 호출하고 
ajax 객체가 readystatechange 호출해서 0,1,2,3,4 모두 다 우리가 만든 function 호출하는데
안에 있는 조건문(if)은 readyState가 4일때만 동작하도록 했다.
-> 4라는 건 요청 서버로부터 응답을 받았다는 것
그런데 그 응답이 제대로 된 응답인지 확인해야 해서 ajax.staus==200으로 확인한다.
제대로 되었다면 업무 진행 callback()


업무 처리 함수 callback()를 그냥 추출해서 밖에다 씀 -> 안에다가 써도  된다.

이렇게 다 수행한 다음에 모든게 다 제대로 되었다면 send해서 실제 서버에서  ajax 요청을 한다.

------
최초 요청은 웹 페이지의 /test02send.do
web.xml 에서 test02send.java 페이지 호출
test02send.java 페이지에서는 view 로 지정한 url 인 AjaxTest02.jsp 로 가도록 포워딩
AjaxTest02.jsp 에서는 웹페이지의 "=" 모양의 버튼을 눌러서 sum() 함수 호출하게 되면, 같은 페이지 기타 다른 요소들 신경 쓸 필요없고, num1과 num2만 가져오게 돼.  여기에 
get 방식으로 보내는, 요청하는 url 에 보내야하는 데이터도 모두 세팅함.
ajax = createAjax(); 함수를 호출하는데 이는 ajax.js 페이지에 있다. createAjax() 는 XMLHttpRequest 객체를 얻어내는 것이 전부. 이 객체를 얻어내는 과정에서 사용자가 이용하는 브라우저를 확정할 수 없으므로 xmlhttprequest 를 지원하는지 아닌지에 따른 여부로 xmlhttprequest() 객체를, 지원하지 않으면 대신 대리 객체인 activexobject 객체를 생성. 두 케이스 모두 해당하지 않으면 ajax 객체를 생성할 수 없으므로 null 반환.

다시 ajaxTest02.jsp 페이지로 돌아와서 얻어낸 ajax 객체가 .open() 메소드 호출. 

web.xml 페이지로 가서 /test02.do url-pattern 을 찾아 test02.java 페이지 로 가기.
test02.java 에서는 받아온 숫자들을 연산해서 test02Ok.jsp 로 결과값만을 포워딩.
test02Ok.jsp 에서 결과값 받은 후 test02send.java 에 다라 ajaxTest02.jsp 페이지로 다시 가.

ajax 가 readystatechange 이벤트가 on 되면 function 호출. 요청했던 서버로부터 응답을 받았고 이게 올바른 응답일 경우 callback() 함수에 따라 업무 진행. callback()이 걸리게 되면, ajax 가 단일데이터인지/다량 데이터인지 조건들을 검토후에 맞는 것을 찾아 responseText로 결과 데이터를 가져와. 마지막 ajax 가 send()로 서버에 데이터를 전송. 

 -->