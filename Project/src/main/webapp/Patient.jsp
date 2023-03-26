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
		<!-- jsp connection and its code  -->
        <%
        String fName ="",lName="";
        int pid = 0; 
        if(session.getAttribute("pid") != null){
        	pid = (Integer)session.getAttribute("pid");
        }
        try{
        	Connection con = new conn().connect();
	        Statement statement = con.createStatement() ;
	        
	        ResultSet rs =statement.executeQuery("select * from patient where id ='"+pid+"'; ") ;
	        if(rs.next()){
	        	fName = rs.getString(2);
	        	lName = rs.getString(3);
	        }
        }catch(Exception e){
        	out.println(e);
        }
        %>
					<jsp:include page="/includePatientHeadside.jsp"/>			
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
        	<div class="container-fluid mt-3">
				<div class="row">
                    <div class="col-lg-12" >
                    	<div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                    <h1>Welcome <%out.print(fName +" "+ lName); %></h1>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>               
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
<jsp:include page="footer.jsp" />