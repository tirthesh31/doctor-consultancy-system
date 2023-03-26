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
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
											<thead>
                                                <tr>
                                                    <th>BLOG TITLE</th>
                                                    <th>BLOG DESCRIPTION</th>
                                                    <th>POSTED ON</th>                                               
                                                </tr>
                                            </thead>
                                            <!-- jsp connection and its code  -->
									        <%
									        int id = (Integer)session.getAttribute("id");
									        System.out.print("here"+id);
											if(id != 0){	
												Connection con = new conn().connect();
												String query = "SELECT * FROM blogs where did = " + id + ";";

									        	Statement st = con.createStatement();
									        	ResultSet rs = st.executeQuery(query);
									        %>
                                            <tbody>
                                            <% while(rs.next()){ %>
                                                <tr>
                                                    <td><% out.print(rs.getString(3));%></td>
                                                    <td><% out.print(rs.getString(4));%></td>
                                                    <td><% out.print(rs.getString(5));%></td>
                                                 </tr>
                                                <% } } %>
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