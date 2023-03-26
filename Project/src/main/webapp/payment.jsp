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
		<%@page import = "java.time.LocalDate"%>
		<%@ page import="javax.mail.*"%>
		<%@ page import="javax.mail.internet.*"%>
		<%@ page import="javax.activation.*"%>
		<% 
		int aid = 0; 
		if(request.getParameter("aid") != null){
			aid = Integer.parseInt(request.getParameter("aid").toString());
			session.setAttribute("aid", aid);
			System.out.println("aid" + aid);
			
		}
		String email = (String)session.getAttribute("email");
		int pid =0;
		if(session.getAttribute("pid") != null){
			pid = (Integer)session.getAttribute("pid");	
		}
		if(email == null){
			response.sendRedirect("index.jsp");
		}
		
		
		if(request.getParameter("submit") != null){
			if(request.getParameter("nameOnCard") != null && request.getParameter("creditCardNo") != null && request.getParameter("expMonth") != null &&
					request.getParameter("expYear") != null && request.getParameter("cvv") != null){
				
					int said=0;
					if(session.getAttribute("aid")!=null){
						System.out.print("hello");
						said = (Integer)session.getAttribute("aid");
						System.out.print("said" +said);
					}else{
						System.out.print("hello2");
					} 
					Connection con = new conn().connect();
			        Statement st = con.createStatement();
			        System.out.print(aid);
			        try{
			        String query = "update appointment set payment = 1 where appointmentId = "+said+";";
			        int rows = st.executeUpdate(query);
				        if(rows > 0){
				        	query =  "SELECT * FROM doctor FULL JOIN appointment ON id=appointment.doctorId where appointment.appointmentId ="+ said+";";	
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
				    			String message="Greetings "+fName+" "+lName+",\n\n An apppointment Fees has paid.\n\n Kindly check for the appointment details .";  


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
			        }catch(Exception e ){
			        	System.out.print(e);
			        }
				
			}else{
				out.print("<script> alert("+"Enter details properly."+")</script>");
			}
		}
		%>	
<jsp:include page="/includePatientHeadside.jsp" />		
          <!--**********************************
            Table Content
        ***********************************-->
          <div class="content-body">

            <div class="container-fluid mt-3">
				<div class="row">
                    <div class="col-lg-12" >
                    	<div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                   <form >
							        	<div class="row">
							            	<div class="col">
								                <h1 class="mb-4"> <span class="badge badge-primary h-25">PAYMENT</span></h1>	
								                <div class="form-group">
											    	<h3 class="mb-1"> <span class="badge badge-primary h-25">name on card :</span></h3>	
											    	<input type="text" class="form-control" id="formGroupExampleInput" name="nameOnCard" placeholder="mr.john">
											  	</div>
											  	<div class="form-group">
											    	<h3 class="mb-1"> <span class="badge badge-primary h-25">credit card number :</span></h3>	
											    	<input type="number" class="form-control" id="formGroupExampleInput" name="creditCardNo" placeholder="1111-2222-3333-4444">
											  	</div>
											  	<div class="form-group">
											    	<h3 class="mb-1"> <span class="badge badge-primary h-25">exp month:</span></h3>	
											    	<input type="text" class="form-control" id="formGroupExampleInput" name="expMonth" placeholder="january">
											  	</div>
											  	<div class="form-group">
											    	<h3 class="mb-1"> <span class="badge badge-primary h-25">exp year:</span></h3>	
											    	<input type="number" class="form-control" id="formGroupExampleInput" name="expYear" placeholder="2022">
											  	</div>
											  	<div class="form-group">
											    	<h3 class="mb-1"> <span class="badge badge-primary h-25">CVV:</span></h3>	
											    	<input type="text" class="form-control" id="formGroupExampleInput" name="cvv" placeholder="1234">
											  	</div>
							            	</div>
							        	</div>
							        <input type="submit" name="submit" value="proceed to checkout" class="btn btn-primary mt-3" >
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
    <script src="./assets/plugins/common/common.min.js"></script>
    <script src="./assets/js/plugins-init/custom.min.js"></script>
    <script src="./assets/js/plugins-init/settings.js"></script>
    <script src="./assets/js/plugins-init/gleek.js"></script>
    <script src="./assets/js/plugins-init/styleSwitcher.js"></script>

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