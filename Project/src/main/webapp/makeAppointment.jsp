<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"	
%>
<!-- importing jsp libraries --> 
		<%@page import="java.sql.*"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.SQLException"%>
		<%@page import="com.connect.conn"%>
		<%@page import = "java.util.* "%>
		<%@page import = "java.util.Date "%>
		<%@page import = "java.time.format.DateTimeFormatter"%>
		<%@page import = "java.time.LocalDate"%>
		<%@page import = "java.time.LocalTime"%>
		<%@ page import="javax.mail.*"%>
		<%@ page import="javax.mail.internet.*"%>
		<%@ page import="javax.activation.*"%>
		<% String email = (String)session.getAttribute("email");		
				if(email == null){
					response.sendRedirect("index.jsp");
				}else if(email.equals("tirtheshmotiwala@gmail.com")){%>			
					<jsp:include page="/includeAdminHeadside.jsp"/> 
				<% } else if(session.getAttribute("id") != null ){%>
					<jsp:include page="/includeheadside.jsp"/>
					<% } else if(session.getAttribute("pid") != null ){ %>
					<jsp:include page="/includePatientHeadside.jsp"/>
					<% } %>			
		<%
		int id=0;
		String fName = "";
		String lName = "";
		
		if(request.getParameter("id")!=null){
			id = Integer.parseInt(request.getParameter("id"));
			session.setAttribute("did",id);
			try{
				Connection con = new conn().connect();
				String query = "SELECT * FROM doctor where id = " + id + ";";
		
		    	Statement st = con.createStatement();
		    	ResultSet rs = st.executeQuery(query);
				
		    	
		    	if (rs != null && rs.next()) {
						fName = rs.getString(2).toString();
						lName = rs.getString(3).toString();
			    	}
			}catch(Exception e){
				System.out.print(e);
			}
			
			if(request.getParameter("submit") != null){
				LocalDate date = LocalDate.parse(request.getParameter("date"));
				String time = request.getParameter("time");
				int pid = (Integer)session.getAttribute("pid");
				
				try{
				Connection con2 = new conn().connect();
				String query = "insert into appointment(doctorId,patientId,aDate,aTime,status,payment) values('"+id+"','"+pid+"','"+date+"','"+time+"',0,0);";
				
				Statement st = con2.createStatement();
				int rows = st.executeUpdate(query);
				
				if(rows > 0){
					System.out.println(rows);
					Connection con = new conn().connect();
					query =  "select * from doctor where id = " + id + ";";	
					st = con.createStatement();
					ResultSet rs = st.executeQuery(query);
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
						String subject="Appointment Request.";  
						String message="Greetings "+fName+" "+lName+",\n\n An apppointment request has generated";  


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
					response.sendRedirect("Patient.jsp");
				}
				}catch(Exception e){
					System.out.println(e);
				}
			}
		
		}
		%>	
		<div class="content-body">

            <div class="container-fluid mt-3">
				<div class="row">
                    <div class="col-lg-12" >
                    	<div class="card">
                            <div class="card-body">
                            	<h3 class="mb-1"> <span class="badge badge-primary h-25">Name:</span></h3>
                            	<h3 class="mb-1"><% out.print(fName + " " + lName); %></h3>
                                <div class="active-member">
                                    <form method="POST">
									  <div class="form-group">
									    <h3 class="mb-1"> <span class="badge badge-primary h-25">Appointment Date</span></h3>	
									    <input type="date" class="form-control" id="date" name="date" >
									  </div>
									  <div class="form-group">
									    <h3 class="mb-1"> <span class="badge badge-primary h-25">Appointment Time</span></h3>
									    <Select class="form-control form-control-lg " id="time" name="time" >
									    </Select>
									  </div>
									  <input type="submit" class="btn btn-primary mt-3" name="submit">
									</form>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>               
            </div>
	</div>	
			
<!--**********************************
        Scripts
    ***********************************-->
    
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src="./assets/plugins/common/common.min.js"></script>
    <script src="./assets/js/plugins-init/custom.min.js"></script>
    <script src="./assets/js/plugins-init/settings.js"></script>
    <script src="./assets/js/plugins-init/gleek.js"></script>
    <script src="./assets/js/plugins-init/styleSwitcher.js"></script>
	<script src="./assets/js/dashboard/appointment.js"></script>
    <!-- Chartjs -->
    <script src="./assets/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="./assets/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="./assets/plugins/d3v3/index.js"></script>
    <script src="./assets/plugins/topojson/topojson.min.js"></script>
    <script src="./assets/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="./assets/plugins/raphael/raphael.min.js"></script>
    <script src="./assets/plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="./assets/plugins/moment/moment.min.js"></script>
    <script src="./assets/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="./assets/plugins/chartist/js/chartist.min.js"></script>
    <script src="./assets/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



    <script src="./assets/js/dashboard/dashboard-1.js"></script>			
</body>
</html>