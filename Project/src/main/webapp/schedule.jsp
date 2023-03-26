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
		<%@page import = "java.util.Date "%>
		<%@page import = "java.time.format.DateTimeFormatter"%>
		<%@page import = "java.time.LocalDate"%>
		<%@page import = "java.time.LocalTime"%>
		<% 
		   
		String email = (String)session.getAttribute("email");
		if(email == null){
			response.sendRedirect("index.jsp");
		}
		int id= 0;
		if(session.getAttribute("id")!=null){
			id = (Integer)session.getAttribute("id"); 	
		}
		
		if(request.getParameter("submit") != null){
			
			LocalDate date = LocalDate.parse(request.getParameter("date"));
			LocalTime startTime = LocalTime.parse(request.getParameter("stime"));
			LocalTime endTime = LocalTime.parse(request.getParameter("etime"));
			LocalTime avoidStartTime = LocalTime.parse(request.getParameter("astime"));
			LocalTime avoidEndTime = LocalTime.parse(request.getParameter("aetime"));
			int avgConusltancyTime = Integer.parseInt(request.getParameter("consultingtime"));

			if(date != null && startTime != null && endTime != null && avoidStartTime != null 
					&& avoidEndTime != null && avgConusltancyTime > -1){
				Connection con = new conn().connect();
				try{
			        String query = "insert into schedule(sdate,startTime,endTime,averageConsultancyTime,startTimeAvoid,endTimeAvoid,did) values('"+date+"','"+startTime+"','"+endTime+"',"+avgConusltancyTime+",'"+avoidStartTime+"','"+avoidEndTime+"',"+id+");";
			    	Statement st = con.createStatement();
			    	int res = st.executeUpdate(query);
			    	if(res > 0){
			    		response.sendRedirect("doctor.jsp");	
			    	}
				}catch(Exception e){
					System.out.println(e);
				}
				
			}else{
				out.println("<script>alert('Enter details properly.');</script>");	
			}
		}
		%>
<jsp:include page="/includeheadside.jsp" />
	<div class="content-body">
		<div class="container-fluid mt-3">
				<div class="row">
                    <div class="col-lg-12" >
                    	<div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                    <form method="POST">
									  <div class="form-group">
									  	<div class="row">
									  		<div class = "col-lg-6">
									  			<div class="row mt-4">
									  				<div class="col-lg-3">
						                            	<span class="label label-primary">Date</span>
						                            </div>
						                            <div class="col-lg-6">
						                            	<input type="date" name="date">
						                            </div>
						                        </div>
						                        <div class="row mt-4">
						                        	<div class="col-lg-3">
						                            	<span class="label label-primary">Start-Time</span>
						                            </div>
						                            <div class="col-lg-6">
						                            	<input type="time" name="stime">
						                            </div>
						                        </div>
						                        <div class="row mt-4">
						                            <div class="col-lg-3">
						                            	<span class="label label-primary">End-Time</span>
						                            </div>
						                            <div class="col-lg-6">
						                            	<input type="time" name="etime">
						                            </div>
						                        </div>
									  		</div>
									  		<div class = "col-lg-6">
									  			<div class="row mt-4">
									  				<div class="col-lg-6">
						                            	<span class="label label-primary">AVERAGE-CONSULTING-TIME</span>
						                            </div>
						                            <div class="col-lg-6">
						                            	<input type="number" name="consultingtime">
						                            </div>
						                        </div>
						                        <div class="row mt-4">
						                        	<div class="col-lg-6">
						                            	<span class="label label-primary">START-TIME-AVOID</span>
						                            </div>
						                            <div class="col-lg-6">
						                            	<input type="time" name="astime">
						                            </div>
						                        </div>
						                        <div class="row mt-4">
						                            <div class="col-lg-6">
						                            	<span class="label label-primary">START-TIME-AVOID</span>
						                            </div>
						                            <div class="col-lg-6">
						                            	<input type="time" name="aetime">
						                            </div>
						                        </div>
									  		</div>
									  	</div>
									  	<input type="submit" class="btn btn-primary mt-3" name="submit">
									  </div>
									</form>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>               
            </div>
	</div>
<jsp:include page="footer.jsp" />