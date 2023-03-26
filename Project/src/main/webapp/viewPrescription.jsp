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
		String fname ="",lname="";
		if(email == null){
			response.sendRedirect("index.jsp");
		}
		int pid = 0;
		if(session.getAttribute("pid") != null){
			pid = (Integer)session.getAttribute("pid"); 
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
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
											<thead>
                                                <tr>
                                                    <th>Doctor Name</th>
                                                    <th>PRECRIPTION</th>
                                                    <th>Review</th>                                               
                                                </tr>
                                            </thead>
                                            <!-- jsp connection and its code  -->
									        <%	
												Connection con = new conn().connect();
												String query = "SELECT * FROM prescription JOIN doctor ON did=doctor.id JOIN appointment ON aid=appointment.appointmentId where appointment.patientId="+ pid+";";

									        	Statement st = con.createStatement();
									        	ResultSet rs = st.executeQuery(query);
									        %>
                                            <tbody>
                                            <% while(rs.next()){ %>
                                                <tr>
                                                    <td><% out.print(rs.getString(6) + " "+ rs.getString(7));%></td>
                                                    <td><% out.print(rs.getString(4));%></td>
                                                    <td><a href="review.jsp?did=<%out.print(rs.getInt(2));%>" ><i class="fa fa-pencil-square"></i></a></td>
                                                 </tr>
                                                <% }  %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>               
            </div>
<jsp:include page="footer.jsp" />