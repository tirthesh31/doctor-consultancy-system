<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-Up</title>
    <link href="./assets/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" referrerpolicy="no-referrer">
</head>
<body>
<!-- importing jsp libraries --> 
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.connect.conn"%>
<%@ page import = " java.util.* "%>
<%@page import="java.security.*"%>


<!-- jsp code -->
<%
String buttonClicked;
Connection con = new conn().connect();
int flag=0;
if(request.getParameter("submit") != null){
	String email = request.getParameter("emailId");
	String pwd = request.getParameter("pwd");
	String hpwd;
	//hash 
	MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(pwd.getBytes());
		byte[] hash = md.digest();
	
		StringBuilder sb = new StringBuilder();
		
		for(byte b : hash){
			sb.append(String.format("%02x",b));
		}
	hpwd = sb.toString();

	Statement statement = con.createStatement() ;

    ResultSet resultset =statement.executeQuery("SELECT * FROM doctor FULL JOIN validate ON id=validate.did;") ;
    while(resultset.next()){
    	String Email = resultset.getString(4);
    	String Pwd = resultset.getString(9);
	    if(Email.equals(email) && Pwd.equals(hpwd)){
	    	if(resultset.getBoolean(12)){
	    		session.setAttribute("id",resultset.getInt(1));
	    		session.setAttribute("patientId", 1);
		        session.setAttribute("email",Email);
		        session.setAttribute("pwd",Pwd);
		        response.sendRedirect("doctor.jsp");	
		        break;
	    	}else{
	    		flag = 1;
	    		out.println("<script>alert('Currently you are not permitted to access the system.');</script>");
	    	}
	    }    
    }
    ResultSet resultset2 =statement.executeQuery("select * from patient") ;
    while(resultset2.next()){
    	int patientId = resultset2.getInt(1);
    	String Email = resultset2.getString(4);
    	String Pwd = resultset2.getString(9);
        if(Email.equals(email) && Pwd.equals(hpwd)){
        	session.setAttribute("pid",patientId);
        	
        	session.setAttribute("email",Email);
        	session.setAttribute("pwd",Pwd);
        	response.sendRedirect("Patient.jsp");
        	break;
        }
    }
    ResultSet resultset3 =statement.executeQuery("select * from admin") ;
    while(resultset3.next()){
    	String Email = resultset3.getString(2);
    	String Pwd = resultset3.getString(3);
        if(Email.equals(email) && Pwd.equals(pwd)){
        	session.setAttribute("adminid",0);
        	session.setAttribute("email",Email);
        	session.setAttribute("pwd",Pwd);
        	response.sendRedirect("admin.jsp");
        	break;
        }else if(flag == 0){
        	out.println("<script>alert('Username or Password is invalid');</script>");
        }
    }
    
}
%>

    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form method="POST" class="sign-in-form">
                    <a href="index.jsp" class="logo"><i class="fas fa-heartbeat"></i>medcare</a>
                    <h2 class="title">Sign in</h2>
                    <label>Email ID:</label>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="emailId" placeholder="EMAIL ID" required>
                    </div>
                    <label>Password:</label>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="pwd" placeholder="password" >
                    </div>
                    <input type="submit" name="submit" class="btnsolid" value="Login">
                </form>
                <div class="pic">
                	<div class="eff">
                    	<img src="./assets/img/doctors/doctors-1.jpg" alt="hiie">
                    </div>
                </div>
                <div class="btn">
                    <h3 style=" font-size: 12px;">If you dont register. Please register first <a href="Registration.jsp" style="font-size: 14px;">REGISTER</a></h3>
                    <h3 style="font-size: 12px; margin-top: 5px;">If you lost your password than click on this link<a href="forgetPassword.jsp" style="font-size: 14px;">FORGET PASSWORD</a></h3>
                </div>
            </div>
        </div>
    </div>
</body>
</html>