/**
 * ajax.js
 */


var ajax = null;

// AJAX 객체(XMLHttpRequest 객체) 생성 함수
function createAjax()
{
	/*
	// ActiveXOBject 를 지원하는 브라우저라면....
	if (window.ActiveXObject)						//-- IE 7 이전
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
		//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		//   (ActiveXObject 객체 → XMLHttprequest 객체의 대리 객체)
	}
	else 											//-- 그 외 브라우저
	{
		if (window.XMLHttpRequest)					//-- XMLHttpRequest 지원 브라우저
		{
			return new XMLHttpRequest();
			//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		}
		else 										//-- AJAX 를 지원하지 않는 브라우저
		{
			return null;
		}
	}
	*/
	
	if (window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		//return new ActiveXObject("Msxml2.XMLHTTP");
		return new ActiveXObject("Microsoft.XMLHTTP");
		// 둘 다 같은 코드 (요즘은 잘 사용하지 않지만 사용자들이 브라우저를 뭘 쓸 지 모르니까)
	}
	else
	{
		return null;
	}
	
}