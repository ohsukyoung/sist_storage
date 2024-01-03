/**
 * ajax.js
 */

var ajax = null;

// AJAX 객체(→ XMLHttpRequest 객체) 생성 함수
function createAjax()
{
	/*
	// ActiveXObject 를 지원한느 브라우저 라면...
	if(window.ActiveXObject)	//-- IE 7 이전
	{
		//return new ActiveXObejct("Microsoft.XMLHTTP");
		return new ActiveXObejct("Msxml2.XMLHTTP");
		//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		//	 (ActiveXObject 객체 → XMLHttpRequest 객체를 대신할 수 있는 객체)
	}
	else						//-- 그 외 브라우저
	{
		if(window.XMLHttpRequest)//-- XMLHttpRequest 객체 지원 브라우저
		{
			return new XMLHttpRequest();
			//-- 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		}
		else					//-- AJAX 를 지원하지 않는 브라우저
		{
			return null;
			//-- AJAX 사용할 수 없으므로 null 을 반환해라.
		}
		
		return new XMLHttpRequest();
	}
	*/
	
	/*
	if(window.ActiveXObject)	//-- IE 7 이전
		return new ActiveXObejct("Microsoft.XMLHTTP");
	else if(window.XMLHttpRequest)//-- XMLHttpRequest 객체 지원 브라우저
			return new XMLHttpRequest();
	else						//-- AJAX 를 지원하지 않는 브라우저
		return null;
	*/
	
	if(window.XMLHttpRequest)//-- XMLHttpRequest 객체 지원 브라우저
		return new XMLHttpRequest();
	else if(window.ActiveXObject)	//-- IE 7 이전
		return new ActiveXObejct("Microsoft.XMLHTTP");
	else						//-- AJAX 를 지원하지 않는 브라우저
		return null;
}