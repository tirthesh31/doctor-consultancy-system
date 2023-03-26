<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/css/otp.css">
    
</head>
<%
try{
	int OTP = (Integer)session.getAttribute("OTP");
	if(OTP ==  Integer.parseInt(request.getParameter("otp"))){
		response.sendRedirect("changePassword.jsp");
	}else{
		out.println("<script>alert('Enter password properly..');</script>");
	}
}catch(Exception e){
	System.out.println(e);
}
%>
<body>
    <div class="background">
        <div class="intro">OTP</div>
        <div class="bsec">
            <h4>ENTER THE OTP FOR LOGIN: <BR> FOR THE NUMBER</h4>
            <form method="post">
                <div class="ibg">
                    <input type="number" name="otp" >
                </div>
                <div class="btn">
                    <input type="submit" class="btnsolid" value="Login" name="submit">
                </div>
            </form>
        </div>
    </div>
</body>
</html>