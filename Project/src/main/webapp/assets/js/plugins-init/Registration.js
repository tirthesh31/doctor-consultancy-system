var navbar = document.querySelector("register-right");
console.log(navbar);



function setHomeActive()
{
	console.log("Home Clicked");
	var home = document.getElementById("home-tab");
	
	home.classList.add("active");	
}

navbar.forEach(element =>{
	element.addEventListener("click",function(){
		navbar.forEach(nav=>nav.classList.remove("active"));
		this.classList.add("active");	
	})
});