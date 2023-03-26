<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"	
%>
<!DOCTYPE html>
<html>
<head>
<link href="./assets/css/forgetPassword.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- importing jsp libraries --> 
		<%@page import="java.sql.*"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.SQLException"%>
		<%@page import="com.connect.conn"%>
		<%@page import="java.util.concurrent.ThreadLocalRandom"%>
		<%@ page import="javax.mail.*"%>
		<%@ page import="javax.mail.internet.*"%>
		<%@ page import="javax.activation.*"%>
		<%@ page import="java.util.*" %>
		<%@ page import="java.io.*" %>
		<%@ page import="java.lang.Object" %>
		
<%
if(request.getParameter("submit") != null){
	try{
		int flag = 0;
		Connection con = new conn().connect();
	    Statement statement = con.createStatement() ;
	    ResultSet resultset =statement.executeQuery("select * from doctor;") ;
	    int number = ThreadLocalRandom.current().nextInt(1000, 9999 + 1);
	    String mail = request.getParameter("email");
	    while(resultset.next()){
	    		if(request.getParameter("email").equals(resultset.getString(4))){
	    			flag = 1;
	    		}
	         }
	    if(flag == 1){
	    	session.setAttribute("OTP",number);
	    	session.setAttribute("email",mail);
	    	session.setAttribute("user","doctor");
	    	System.out.println(number);
	    	try{
	    		//SMTP for sending mail
	    		System.setProperty("javax.net.debug", "ssl:handshake");
	    		//Creating a result for getting status that messsage is delivered or not!
	    		String to=mail;  
	    		String subject="Your OTP";  
	    		String message="Thank you for contacting us. Here is Your OTP:"+number;  
	
	
	    		String from="appointmanage017058@gmail.com";  
	    		String pass="ybtbaljjogrpotlx";  
	    		String host="smtp.gmail.com";  
	
	    		Properties props = System.getProperties();
	    		System.setProperty("jdk.tls.client.cipherSuites","TLS_AES_128_GCM_SHA256,TLS_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_GCM_SHA384");
	
	    		props.put("mail.smtp.starttls.enable", "true");
	
	    		props.put("mail.smtp.ssl.protocols", "TLSv1.3");
	    		props.put("mail.smtp.host", host);  
	    		props.put("mail.smtp.user", from);  
	    		props.put("mail.smtp.password", pass);  
	    		props.put("mail.smtp.port", "587");  
	    		props.put("mail.smtp.auth", "true");
	    		props.put("mail.smtp.ssl.trust", "*");
	
	
	    		Session se = Session.getDefaultInstance(props, null);  
	    		MimeMessage mimeMessage = new MimeMessage(se);  
	    		mimeMessage.setFrom(new InternetAddress(from));  
	    		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	    		mimeMessage.setSubject(subject);  
	    		mimeMessage.setText(message);  
	    		Transport transport = se.getTransport("smtp");  
	    		transport.connect(host, from, pass);  
	    		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());  
	    		request.removeAttribute("email");
	
	    		}
	    		catch(Exception e)
	    		{
	    		System.out.println(e);
	    		}
	    	response.sendRedirect("otp.jsp");
	    }else{
	    	ResultSet resultset1 =statement.executeQuery("select * from patient;") ;
	        while(resultset1.next()){
	        		if(request.getParameter("email").equals(resultset1.getString(4))){
	        			flag = 1;
	        		}
	             }
	        if(flag == 1){
	        	session.setAttribute("OTP",number);
	        	session.setAttribute("email",mail);
	        	session.setAttribute("user","doctor");
	        	System.out.println(number);	
	        	try{
	        		//SMTP for sending mail
	        		System.setProperty("javax.net.debug", "ssl:handshake");
	        		//Creating a result for getting status that messsage is delivered or not!
	        		String to=mail;  
	        		String subject="Your OTP";  
	        		String message="Thank you for contacting us. Here is Your OTP:"+number;  
	
	
	        		String from="appointmanage017058@gmail.com";  
	        		String pass="ybtbaljjogrpotlx";  
	        		String host="smtp.gmail.com";  
	
	        		Properties props = System.getProperties();
	        		System.setProperty("jdk.tls.client.cipherSuites","TLS_AES_128_GCM_SHA256,TLS_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_GCM_SHA384");
	
	        		props.put("mail.smtp.starttls.enable", "true");
	
	        		props.put("mail.smtp.ssl.protocols", "TLSv1.3");
	        		props.put("mail.smtp.host", host);  
	        		props.put("mail.smtp.user", from);  
	        		props.put("mail.smtp.password", pass);  
	        		props.put("mail.smtp.port", "587");  
	        		props.put("mail.smtp.auth", "true");
	        		props.put("mail.smtp.ssl.trust", "*");
	
	
	        		Session se = Session.getDefaultInstance(props, null);  
	        		MimeMessage mimeMessage = new MimeMessage(se);  
	        		mimeMessage.setFrom(new InternetAddress(from));  
	        		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	        		mimeMessage.setSubject(subject);  
	        		mimeMessage.setText(message);  
	        		Transport transport = se.getTransport("smtp");  
	        		transport.connect(host, from, pass);  
	        		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());  
	        		request.removeAttribute("email");
	
	        		}
	        		catch(Exception e)
	        		{
	        		System.out.println(e);
		
	        		}
	        	response.sendRedirect("otp.jsp");
	        }else{
	        	out.println("<script>alert('Email is not registered...');</script>");
	        }
	    }
	}catch(Exception e){
		out.println(e);
	}
}
%>
<div class="container">
            <div class="pic">
                        <img src="./assets/img/gallery/bg.jpg" alt="hiie">
            </div>
            <div class="data">
                <div class="head">
                <label for="">FORGET PASSWORD MODULE</label>
                </div>
                <div class="form">
                    <form method="POST">
                        <div class="info">
                            <div class="label">
                            <label for="">ENTER YOUR EMAIL</label>
                            </div>
                            <input type="text" name="email">
                        </div>
                        <div class="info">
                            <button type="submit" name="submit">SUBMIT</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>