/**
 * myMenu.js
 */

/*
function myMenu1()
{}

function myMenu2()
{}
*/

function myMenu(status)
{
	//alert("test"+status);
	
	var menu = document.getElementById("menuTable");
	
	if (status==1)
	{
		//alert("1번 확인");
		
		menu.style.display = "block";
	}
	else
	{
		//alert("2번 확인");
		
		menu.style.display = "none";
	}


}