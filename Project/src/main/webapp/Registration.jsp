<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="./assets/css/Registration.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
function setHomeActive()
{
	var homeTab = document.getElementById("home-tab");
	var profileTab = document.getElementById("profile-tab");
	var home = document.getElementById("home");
	var profile = document.getElementById("profile");
	
	profileTab.classList.remove("active");
	homeTab.classList.add("active");
	profile.classList.remove("active");
	home.classList.add("active");
}
function setProfileActive()
{
	var homeTab = document.getElementById("home-tab");
	var profileTab = document.getElementById("profile-tab");
	var home = document.getElementById("home");
	var profile = document.getElementById("profile");
	
	homeTab.classList.remove("active");	
	profileTab.classList.add("active");
	home.classList.remove("active");	
	profile.classList.add("active");
}
</script>
<!-- importing jsp libraries --> 
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.connect.conn"%>
<%@page import="java.security.*"%>
<%@page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>

<!-- jsp code -->
<%
String buttonClicked;
Connection con = new conn().connect();
int flag=0;
if(request.getParameter("btnPatient") != null)
{
	String firstName = request.getParameter("fName");
	String lastName = request.getParameter("lName");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String password = request.getParameter("pwd");
	String cPassword = request.getParameter("cPwd");
	String bloodGrp = request.getParameter("bloodGrp");
	String diseases = request.getParameter("diseases");	
	String hashValue;
	String chashValue;
	
	if(!firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty() && !phone.isEmpty() && !gender.isEmpty() 
	&& !password.isEmpty() && !cPassword.isEmpty() && !bloodGrp.isEmpty() && !diseases.isEmpty()){
		if(password.equals(cPassword)){
			if(phone.length() == 10){
				Statement statement2 = con.createStatement() ;
                ResultSet resultset2 =statement2.executeQuery("select * from patient where email = '" + email + "'");
                while(resultset2.next()){
                	flag++;
                }
                if(flag==0){
                	// Hash the entered password
    				MessageDigest md = MessageDigest.getInstance("MD5");
      				md.update(password.getBytes());
      				byte[] hash = md.digest();
					
      				StringBuilder sb = new StringBuilder();
      				
      				for(byte b : hash){
      					sb.append(String.format("%02x",b));
      				}
					hashValue = sb.toString();
					chashValue = hashValue;
					String columnNames[] = {"fname","lname","email","phone","gender","bloodGrp","diseases","password"};
					String values[] ={firstName,lastName,email,phone,gender,bloodGrp,diseases,hashValue};
                	boolean res = new conn().insert("patient",columnNames,values);
                	if(res == true){
                	response.sendRedirect("login.jsp");
                	}else{
                	System.out.println(hashValue);
                	out.println("<script>alert('Failed to insert');</script>");
                	}
                }else{
                	out.println("<script>alert('This Email is already taken....');</script>");	
                }
			}else{
				out.println("<script>alert('Check your phone number....');</script>");
			}
		}else{
			out.println("<script>alert('Check your password....');</script>");
		}
	}else{
		out.println("<script>alert('Enter your details properly....');</script>");
	}
}else if(request.getParameter("btnDoctor")!= null){
	String firstName = request.getParameter("dFName");
	String lastName = request.getParameter("dLName");
	String email = request.getParameter("dEmail");
	String phone = request.getParameter("dPhone");
	String degree = request.getParameter("degree");
	String password = request.getParameter("dPwd");
	String cPassword = request.getParameter("dCPwd");
	String profession = request.getParameter("profession");
	String year = request.getParameter("year");
	String hashValue;
	String chashValue;
	
	if(!firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty() && !phone.isEmpty() && !degree.isEmpty() 
	&& !password.isEmpty() && !cPassword.isEmpty() && !profession.isEmpty() && !year.isEmpty()){
				if(password.equals(cPassword)){
					if(phone.length() == 10){
						Statement statement2 = con.createStatement() ;
		                ResultSet resultset2 =statement2.executeQuery("select * from doctor where email = '" + email + "'");
		                while(resultset2.next()){
		                	flag++;
		                }
		                if(flag==0){
		                	// Hash the entered password
		    				MessageDigest md = MessageDigest.getInstance("MD5");
		      				md.update(password.getBytes());
		      				byte[] hash = md.digest();
							
		      				StringBuilder sb = new StringBuilder();
		      				
		      				for(byte b : hash){
		      					sb.append(String.format("%02x",b));
		      				}
							hashValue = sb.toString();
							chashValue = hashValue;
							String columnNames[] = {"fname","lname","email","phone","degree","profession","year","password"};
							String values[] ={firstName,lastName,email,phone,degree,profession,year,hashValue,};
		                	boolean res = new conn().insert("doctor",columnNames,values);
		                	if(res == true){
		                		int did = 0;
		                		ResultSet r = new conn().select("doctor",1);
		                		if (r != null && r.next()) {
		                	          did = r.getInt("id");
		                	    }
		                		res = new conn().insert("validate",did);
		                		if(res == true){
		                			try{
		                	    		//SMTP for sending mail
		                	    		System.setProperty("javax.net.debug", "ssl:handshake");
		                	    		//Creating a result for getting status that messsage is delivered or not!
		                	    		String to="tirtheshmotiwala@gmail.com";//admin email id  
		                	    		String subject="New request for permission has generated.";  
		                	    		String message="Please validate the doctor.";  
		                	
		                	
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
			                		out.println("<script>alert('Account Created Successfully....');</script>");
			                		response.sendRedirect("login.jsp");
		                		}else{
		                			out.println("<script>alert('Account Created ....');</script>");
		                		}
		                	}else{
		                	out.println("<script>alert('Please insert your Password properly');</script>");
		                	}
		                }else{
		                	out.println("<script>alert('This Email is already taken....');</script>");	
		                }
					}else{
						out.println("<script>alert('Check your phone number....');</script>");
					}
				}else{
					out.println("<script>alert('Check your password....');</script>");
				}
			}else{
				out.println("<script>alert('Enter your details properly....');</script>");
			}
}


%> 
<!------ Include the above in your HEAD tag ---------->
<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h3>Welcome</h3>
                        <p>We are always there to help you</p>
                        <a href = "login.jsp"> LOGIN</a>
                        <a href = "index.jsp">HOME</a>
                    </div>
                    <div class="col-md-9 register-right" id="navbar">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" onClick="setHomeActive()" id="home-tab" data-toggle="#home" href="#home" role="tab" aria-controls="home" aria-selected="true">Patient</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" onClick="setProfileActive()" id="profile-tab" data-toggle="#profile" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Doctor</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Apply as a Patient</h3>
                                <form class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="fName" class="form-control" placeholder="First Name *"  />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="lName" class="form-control" placeholder="Last Name *"  />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pwd" class="form-control" placeholder="Password *" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="cPwd" class="form-control"  placeholder="Confirm Password *"  />
                                        </div>
                                        <div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="male" checked>
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="female">
                                                    <span>Female </span> 
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-control" placeholder="Your Email *"  />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="phone" maxlength="10" name="txtEmpPhone" class="form-control" placeholder="Your Phone *"  />
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" name="bloodGrp">
                                                <option class="hidden"  selected disabled>Choose your blood group</option>
                                                <option>A+</option>
                                                <option>B+</option>
                                                <option>AB+</option>
                                                <option>O+</option>
                                                <option>A-</option>
                                                <option>B-</option>
                                                <option>AB-</option>
                                                <option>O-</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="diseases" class="form-control" placeholder="Predetermine Diseases *"  />
                                        </div>
                                        <input type="submit" class="btnRegister" name="btnPatient" value="Register"/>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h3  class="register-heading">Apply as a Doctor</h3>
                                <form class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="dFName" placeholder="First Name *"  />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="dLName" placeholder="Last Name *"  />
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="dEmail" placeholder="Email *" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" maxlength="10" minlength="10" name="dPhone" class="form-control" placeholder="Phone *" />
                                        </div>
										<div class="form-group">
                                            <select class="form-control" name="degree">
                                                <option class="hidden"  selected disabled>Please select your Degree Name</option>
                                                <%
                                                Statement statement = con.createStatement() ;

                                                ResultSet resultset =statement.executeQuery("select * from degree") ;
                                                while(resultset.next()){ %>
										            <option><%= resultset.getString(2)%></option>
										        <% } %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                    	<div class="form-group">
                                            <select class="form-control" name="profession">
                                                <option class="hidden"  selected disabled>Enter your Profession</option>
                                                <%
                                                Statement statement1 = con.createStatement() ;

                                                ResultSet resultset1 =statement1.executeQuery("select * from profession") ;
                                                while(resultset1.next()){ %>
									            <option><%= resultset1.getString(2)%></option>
									        <% } %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" name="year">
                                                <option class="hidden"  selected disabled>How many years of experience?</option>
                                                <option>1 year</option>
                                                <option>2 year</option>
                                                <option>3 year</option>
                                                <option>4 year</option>
                                                <option>5 year and more</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="dPwd" class="form-control" placeholder="Password *"  />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="dCPwd" class="form-control" placeholder="Confirm Password *" />
                                        </div>
                                        <input type="submit" class="btnRegister" name="btnDoctor" value="Register"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>