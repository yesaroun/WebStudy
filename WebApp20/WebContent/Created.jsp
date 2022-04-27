<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/created.css">
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>
<script type="text/javascript">

	function sendIt()
	{
		f = document.myForm;
		
		// 제목 입력 확인 ------------------------------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.subject.value;
		str = str.trim();
		
		// ※ javascript 에는 trim() 이 존재하지 않음.(정정 chrome 4 부터 trim() 함수 지원)
		//    외부에서 참조한 util.js에 만들어두었음.
		
		// 테스트
		//alert("|" + str + "|");
		
		if (!str)
		{
			alert("\n제목을 입력하세요~!!!");
			f.subject.focus();
			return;
		}
		// ------------------------------------------------ 제목 입력 확인
		
		// 이름 입력 확인-------------------------------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.name.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n이름을 입력하세요~!!!");
			f.subject.focus();
			return;
		}
		// ------------------------------------------------- 이름 입력 확인
		
		// 이메일 검사 ----------------------------------------------------
		// 필수 입력 항목이 아니므로 선택적인 입력이 가능하지만
		// 입력을 한 상황이면, 이메일 형식에 맞게 입력했는지 
		// 확인하는 처리
		
		if (f.email.value)	// 이메일을 입력한 상황이라면....
		{
			if (!isValidEmail(f.email.value)) 	// (정규표현식은 구글링하면 많이 나온다. 이거 정규표현식은 js 파일에 있음)
			{
				alert("\n정상적인 이메일 형식을 입력하세요~!!!");
				f.email.focus();
				return;
			}
		}
		//----------------------------------------------------- 이메일 검사
		
		// 내용 입력 확인-------------------------------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.content.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n내용을 입력하세요~!!!");
			f.content.focus();
			return;
		}
		// ------------------------------------------------- 내용 입력 확인
		
		// 패스워드 입력 확인----------------------------------------------
		// 필수 입력 항목 기재 여부 항목 및 공백 처리
		str = f.pwd.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n패스워드를 입력하세요~!!!");
			f.pwd.focus();
			return;
		}
		//---------------------------------------------- 패스워드 입력 확인
		
		f.action = "<%=cp%>/Created_ok.jsp";
		
		f.submit();
		
	}

</script>
</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<form action="" method="post" name="myForm">
		
		<div id="bbsCreated">
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
						<input type="text" name="subject" size="64" class="boxTF" maxlength="100"/>
					</dd>
				</dl>
			</div><!-- close.bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작성자</dt>
					<dd>
						<input type="text" name="name" size="35" maxlength="20" class="boxTF"/>
					</dd>
				</dl>
			</div><!-- close.bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일</dt>
					<dd>
						<input type="text" name="email" size="35" maxlength="50" class="boxTF"/>
					</dd>
				</dl>
			</div><!-- close.bbsCreated_bottomLine -->
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<textarea name="content" cols="63" rows="12" class="boxTA"></textarea>
					</dd>
				</dl>			
			</div><!-- close #bbsCreated_content -->
			
			
			<div class="bbsCreated_noLine">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="password" name="pwd" size="35" maxlength="10" class="boxTF"/>
						&nbsp;<span style="font-size: 6pt;">(게시물 수정 및 삭제 시 필요)</span>
					</dd>
				</dl>
			</div><!-- close .bbsCreated_noLine -->
			
			
			<div id="bbsCreated_footer">
				<input type="button" value="등록하기" class="btn2"
				 onclick="sendIt()"/>
				<input type="reset" value="다시입력" class="btn2"
				 onclick="document.myForm.subject.focus();"/>
				<input type="button" value="작성취소" class="btn2" 
				 onclick="javascript:location.href='<%=cp%>/List.jsp'"/>			
			</div><!-- close #bbsCreated_foote -->
			
		
		</div><!-- close #bbsCreated -->
	
	</form>

</div><!-- close #bbs -->

</body>
</html>











