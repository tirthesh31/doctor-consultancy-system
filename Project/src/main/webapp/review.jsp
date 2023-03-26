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
		<%@page import = "java.time.format.DateTimeFormatter"%>
		<%@page import = "java.time.LocalDateTime"%>
		<% 
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
		LocalDateTime now = LocalDateTime.now();
		   
		String email = (String)session.getAttribute("email");
		if(email == null){
			response.sendRedirect("index.jsp");
		}
		System.out.print(email);
		int id=0;
		int pid =0;
		pid = (Integer)session.getAttribute("pid");
		if(request.getParameter("did") != null){
			id = Integer.parseInt(request.getParameter("did")); 
		}
		
		if(request.getParameter("submit") != null){
			System.out.print(now);
			String rev = request.getParameter("rev");
			
			Connection con  = new conn().connect();
			String query = "INSERT INTO review (did,pid,review,reviewDate) values ("+ id + ","+ pid +",'"+ rev +"','"+now+"');";
			Statement st = con.createStatement();
			st.executeUpdate(query);
		
			con.close();
			response.sendRedirect("Patient.jsp");
		}
		%>
<jsp:include page="/includePatientHeadside.jsp" />
	<div class="content-body">

            <div class="container-fluid mt-3">
				<div class="row">
                    <div class="col-lg-12" >
                    	<div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                    <form method="POST">
									  <div class="form-group">
									    <h3 class="mb-1"> <span class="badge badge-primary h-25">Review</span></h3>
									    <textarea class="form-control form-control-lg " id="exampleFormControlTextarea1" name="rev" style="height:260px;"></textarea>
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
<jsp:include page="footer.jsp" />