/**
 * myMenu.js
 */
/*
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/

function myMenu(status)
{
	//**자바와는 다르게 자바스크립트에서는 매개변수가 없어도 실행가능**
	// 확인
	//alert("함수 호출~!!");
	
	//alert(status);
	
	var menu = document.getElementById("menuTable");
	
	if(status==1)
	{
		//alert("1번 확인");
		
		// 스타일 제어
		menu.style.display="block";
	}
	else
	{
		//alert("2번 확인");
		
		// 스타일 제어
		menu.style.display="none";
	}
}
