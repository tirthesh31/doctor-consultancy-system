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
    <link rel="stylesheet" href="./assets/css/changePassword.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<!-- importing jsp libraries --> 
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.connect.conn"%>
<%@page import="java.security.*"%>
<%@page import="java.util.*"%>

<%
if(request.getParameter("submit") != null){
	try{
		Connection con = new conn().connect();
		String mail = (String)session.getAttribute("email");
		String pwd = request.getParameter("password");
		String user = (String)session.getAttribute("user");
		String cpwd = request.getParameter("confirmPassword");
		String hashValue;
		MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(pwd.getBytes());
			byte[] hash = md.digest();
		
			StringBuilder sb = new StringBuilder();
			
			for(byte b : hash){
				sb.append(String.format("%02x",b));
			}
		hashValue = sb.toString();
		if(pwd.equals(cpwd)){
			PreparedStatement p = con.prepareStatement("update "+ user + " set password = '"+hashValue+"' where email= '"+mail+"';");
			p.executeUpdate();
			response.sendRedirect("login.jsp");
		}else{
			out.println("<script>alert('Enter password properly..');</script>");
		}
	}catch(Exception e){
		System.out.println(e);
	}
}
%>
<body>
<div class="mainDiv">
    <img src="./assets/img/gallery/bg.jpg" alt="">
  <div class="cardStyle">
    <form method="post" name="signupForm" id="signupForm">
        <div class="logo">
    <a href="index.jsp" class="logo"><i class="fas fa-heartbeat"></i>medcare</a>
    </div>
    <div class="inputDiv">
      <label class="inputLabel" for="password">New Password</label>
      <input type="password" id="password" name="password" required>
    </div>
      
    <div class="inputDiv">
      <label class="inputLabel" for="confirmPassword">Confirm Password</label>
      <input type="password" id="confirmPassword" name="confirmPassword">
    </div>
    
    <div class="buttonWrapper">
      <button type="submit" id="submitButton" name="submit" class="submitButton pure-button pure-button-primary">
        <span>Continue</span>
        <span id="loader"></span>
      </button>
    </div>
      
  </form>
  </div>
</div>
</body>
</html>