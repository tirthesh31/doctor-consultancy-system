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
		String email = (String)session.getAttribute("email");
		if(email == null){
			response.sendRedirect("index.jsp");
		}
		int did = 0;
		int aid = 0;
		if(request.getParameter("aid") != null){
			aid = Integer.parseInt(request.getParameter("aid"));
		}
		if(session.getAttribute("id") != null){
			did = (Integer)session.getAttribute("id"); 
		}
		
		
		Connection con = new conn().connect();
				
		if(request.getParameter("submit") != null){
			

			String pre = request.getParameter("cPre");
			
			String query = "INSERT INTO prescription(did,aid,pre_content) values ("+ did + ","+ aid +",'"+ pre +"');";
			Statement st = con.createStatement();
			st.executeUpdate(query);
		
			con.close();
			response.sendRedirect("doctor.jsp");
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
									    <h3 class="mb-1"> <span class="badge badge-primary h-25">Customer ID</span></h3>	
									    <input type="number" class="form-control" id="formGroupExampleInput" name="aId" value = <%out.print(aid); %>>
									  </div>
									  <div class="form-group">
									    <h3 class="mb-1"> <span class="badge badge-primary h-25">Prescription</span></h3>
									    <textarea class="form-control form-control-lg " id="exampleFormControlTextarea1" name="cPre" style="height:260px;"></textarea>
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