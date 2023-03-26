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
		<% 
		String email = (String)session.getAttribute("email");
		if(email == null){
			response.sendRedirect("index.jsp");
		}else if(email.equals("tirtheshmotiwala@gmail.com")){%>			
			<jsp:include page="/includeAdminHeadside.jsp"/> 
		<% } else if(session.getAttribute("id") != null){%>
			<jsp:include page="/includeheadside.jsp"/>
			<% }%>
	<div class="content-body">

            <div class="container-fluid mt-3">
				<div class="row">
                    <div class="col-lg-12" >
                    	<div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
											<thead>
                                                <tr>
                                                    <th>New Doctor</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Gender</th>
                                                    <th>Blood Group</th>
                                                    <th>Diseases</th>                                               
                                                </tr>
                                            </thead>
                                            <!-- jsp connection and its code  -->
									        <%
									        Connection con = new conn().connect();
									        int countPatient=0,appointment=0,income=0;
									        
										        Statement statement = con.createStatement() ;
										        ResultSet r;
										        r =statement.executeQuery("select * from patient;") ;
										        if(session.getAttribute("id") != null){
										        	r =statement.executeQuery("select distinct id,fname,lname,email,phone,gender,bloodGrp,diseases from patient FUll JOIN appointment on id = appointment.patientId where appointment.doctorId ="+ Integer.parseInt(session.getAttribute("id").toString())+ "; ") ;
										        }
										    
									        %>
                                            <tbody>
                                            <%while(r.next()){ %>
                                                <tr>
                                                    <td><%out.print(r.getString(2).toUpperCase() + " " + r.getString(3).toUpperCase()); %></td>
                                                    <td><% out.print(r.getString(4));%></td>
                                                    <td>
                                                        <span><% out.print(r.getString(5));%></span>
                                                    </td>
                                                    <td><% out.print(r.getString(6));%></td>
                                                    <td><% out.print(r.getString(7));%></td>
                                                    <td><% out.print(r.getString(8));%></td>
                                                 </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>               
            </div>
        </div>    
<jsp:include page="footer.jsp" />