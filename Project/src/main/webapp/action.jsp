<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.SQLException"%>
		<%@page import="com.connect.conn"%>
		<%@page import = "java.util.* "%>
		<%@ page import="javax.mail.*"%>
		<%@ page import="javax.mail.internet.*"%>
		<%@ page import="javax.activation.*"%>
<%
String email="",fname="",lname="";
Connection con = new conn().connect();
if(request.getParameter("deleteid") != null){
	int id = Integer.parseInt(request.getParameter("deleteid"));
	
    String query =  "select * from doctor where id = " + id + ";";	
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
		fname = rs.getString(2);
		lname = rs.getString(3);
		email = rs.getString(4);	
	}
	try{
		//SMTP for sending mail
		System.setProperty("javax.net.debug", "ssl:handshake");
		//Creating a result for getting status that messsage is delivered or not!
		String to=email;//admin email id  
		String subject="Account Deleted.";  
		String message="Greetings "+fname+" "+lname+",\n\n You are prohibited to access our website Permanently.\n\n To catch up with the reason please call to our helpline number. \n 8980459949";  


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
		out.print(id);
	    boolean r = new conn().delete("doctor", "id", id);
	    boolean r1 = new conn().delete("validate", "did", id);
	    boolean r2 = new conn().delete("blogs", "did", id);
	    boolean r3 = new conn().delete("appointment", "doctorId", id);
	    boolean r4 = new conn().delete("schedule", "did", id);
    out.print("<script>alert("+ "Account Deleted Successfully :)" +");</script>");
    response.sendRedirect("listDoctor.jsp");
}else if(request.getParameter("updateid") != null){
	try{
		int id = Integer.parseInt(request.getParameter("updateid"));
		String query =  "update validate set vali = " + true + " where did = " + id + ";";	
		Statement st = con.createStatement();
		st.executeUpdate(query);
		
		query =  "select * from doctor where id = " + id + ";";	
		st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
			fname = rs.getString(2);
			lname = rs.getString(3);
			email = rs.getString(4);	
		}
		try{
    		//SMTP for sending mail
    		System.setProperty("javax.net.debug", "ssl:handshake");
    		//Creating a result for getting status that messsage is delivered or not!
    		String to=email;//admin email id  
    		String subject="Request Granted.";  
    		String message="Greetings "+fname+" "+lname+",\n Authenticate process had completed successfully.\n Now, you can access your account \n Thank you for registering";  


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
		con.close();
		response.sendRedirect("listDoctor.jsp");
	}catch(Exception e){
		System.out.println(e);
	}
}else if(request.getParameter("unupdateid") != null){
	try{
		int id = Integer.parseInt(request.getParameter("unupdateid"));
		String query =  "update validate set vali = " + false + " where did = " + id + ";";	
		Statement st = con.createStatement();
		st.executeUpdate(query);
		
		query =  "select * from doctor where id = " + id + ";";	
		st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
			fname = rs.getString(2);
			lname = rs.getString(3);
			email = rs.getString(4);	
		}
		try{
    		//SMTP for sending mail
    		System.setProperty("javax.net.debug", "ssl:handshake");
    		//Creating a result for getting status that messsage is delivered or not!
    		String to=email;//admin email id  
    		String subject="Account Access Block.";  
    		String message="Greetings "+fname+" "+lname+",\n\n You are prohibited to access our website.\n\n To catch up with the reason please call to our helpline number. \n 8980459949";  


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
		con.close();
		response.sendRedirect("listDoctor.jsp");
	}catch(Exception e){
		System.out.println(e);
	}
}else if(request.getParameter("unUpdateAppointApprove") != null){
	try{
		int id = Integer.parseInt(request.getParameter("unUpdateAppointApprove"));
		String query =  "update appointment set status = " + false + " where appointmentId = " + id + ";";	
		Statement st = con.createStatement();
		st.executeUpdate(query);
		
		query =  "SELECT * FROM patient FULL JOIN appointment ON id=appointment.patientId where appointment.appointmentId ="+ id+";";	
		st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		String fName="",lName="";
		if(rs.next()){
			fName = rs.getString(2);
			lName = rs.getString(3);
			email = rs.getString(4);	
		}
		try{
			//SMTP for sending mail
			System.setProperty("javax.net.debug", "ssl:handshake");
			//Creating a result for getting status that messsage is delivered or not!
			String to=email;//admin email id  
			String subject="Appointment Satus.";  
			String message="Greetings "+fName+" "+lName+",\n\n An apppointment request has role back due to some reasons.\n\n Your appointment fees will be role back to your account.";  


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
		
		con.close();
		response.sendRedirect("doctor.jsp");
	}catch(Exception e){
		System.out.println(e);
	}
}else if(request.getParameter("appointApprove") != null){
	try{
		int id = Integer.parseInt(request.getParameter("appointApprove"));
		String query =  "update appointment set status = " + true + " where appointmentId = " + id + ";";	
		Statement st = con.createStatement();
		st.executeUpdate(query);
		
		query =  "SELECT * FROM patient FULL JOIN appointment ON id=appointment.patientId where appointment.appointmentId ="+ id+";";	
		st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		String fName="",lName="";
		if(rs.next()){
			fName = rs.getString(2);
			lName = rs.getString(3);
			email = rs.getString(4);	
		}
		try{
			//SMTP for sending mail
			System.setProperty("javax.net.debug", "ssl:handshake");
			//Creating a result for getting status that messsage is delivered or not!
			String to=email;//admin email id  
			String subject="Appointment Satus.";  
			String message="Greetings "+fName+" "+lName+",\n\n An apppointment request has Approved.\n\n Kindly pay to confirm your appointment.";  


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
		
		con.close();
		response.sendRedirect("doctor.jsp");
	}catch(Exception e){
		System.out.println(e);
	}
}
%>
</body>
</html>