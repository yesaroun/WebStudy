/**
 * myMenu.js
 */

/*
function myMenu()
{
	
}

function myMenu2()
{
	
}
*/

function myMenu(status)
{
	//test
	//alert("a");
	
	var menu = document.getElementById("menuTable");
	
	if (status==1)
	{
		//alert("1");
		
		menu.style.display = "block";
	}
	else
	{
		//alert("2");
		
		menu.style.display = "none";
	}
}