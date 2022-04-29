/**
 * myMenu.js
 */

// 기능이 상반될 경우 두 개를 만드는 것이 아니라
/*
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/

// 기능이 상반될 경우 하나로 묶어서 만드는 게 일반적
function myMenu(status)
{
	// 확인
	//alert("함수 호출");
	
	var menu = document.getElementById("menuTable");
	
	if (status==1)
	{
		// 확인
		//alert("1번 확인");
		
		menu.style.display = "block";
	}
	else 
	{
		//alert("2번 확인");
		menu.style.display = "none";
	}
}