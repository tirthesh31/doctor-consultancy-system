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
		int id = 0;
		if(email == null){
			response.sendRedirect("index.jsp");
		}
		if(session.getAttribute("id") != null){
			id = (Integer)session.getAttribute("id");
		}
		Connection con = new conn().connect();
		%>
<jsp:include page="/includeAdminHeadside.jsp" />
	<!--**********************************
            Table Content
        ***********************************-->
          <div class="content-body">
          	<div class="container-fluid mt-3">
          		<div class="row">
          			<div class="col-lg-12" >
          				<div class="card">
          					<div class="card-body">
                                <div class="active-member" id="rep">
                                <% if(id == 0){%>
                                	<div class="row mb-1" >
                                		<div class="col-lg-4">
	                                		<span class="label label-primary">Name:</span>
                                			<span class="label ">Tirthesh Motiwala</span>
	                                	</div>
                                		<div class="col-lg-4">
	                                		<span class="label label-primary">Email:</span>
                                			<span class="label ">tirtheMotiwala@gmail.com</span>
	                                	</div>
                                		<div class="col-lg-4">                               	
	                                		<span class="label label-primary">Contact:</span>
	                                		<span class="label ">8980459949</span>
                                		</div>
                                	</div>
                                	<!-- jsp connection and its code  -->
							        <%
							        int countDoctor=0;
							        int countPatient=0;
							        try{
								        Statement statement = con.createStatement() ;
								        ResultSet resultset =statement.executeQuery("select count(*) from doctor;") ;
								        while(resultset.next()){
								        	countDoctor = Integer.parseInt(resultset.getString(1));
								             }
								        ResultSet resultset1 =statement.executeQuery("select count(*) from patient;") ;
								        while(resultset1.next()){
								        	countPatient = Integer.parseInt(resultset1.getString(1));
								             }
							        }catch(Exception e){
							        	out.println(e);
							        }
							        %>
                                	<div class="row mt-4" >
	                                	<div class="col-lg-12">
	                                		<h3><span class="label label-primary">Data:</span></h3>
	                                	</div>
                                		<div class="col-lg-6">
	                                		<div class="row mt-2" >
		                                		<span class="label label-primary">Number of Doctor:</span>
		                                		<span class="label "><%out.print(countDoctor); %></span>
	                                		</div> 
                                		</div>
                                		<div class="col-lg-6">
	                                		<div class="row mt-2" >
		                                		<span class="label label-primary">Number of Patient:</span>
		                                		<span class="label "><%out.print(countPatient); %></span>
	                                		</div> 
                                		</div>
                                	</div>
                                	<div class="row mt-4" >
                                		<div class="col-lg-12">
	                                		<h3><span class="label label-primary">List of our Doctor:</span></h3>
	                                	</div>
                                	</div>
                                	<%} %>
                                	<table class="table table-xs mb-0" >
                                            <thead>
                                            <% if(id == 0){%>
                                                <tr>
                                                    <th>New Doctor</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Degree</th>
                                                    <th>Profession</th>
                                                    <th>Experience</th>
                                                    <th>Status</th>
                                                </tr>
                                              <%}else{ %>
                                              <tr>
                                                    <th>New Doctor</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Blood Group</th>
                                                    <th>Diseases</th>
                                                </tr>
                                              <%} %>  
                                            </thead>
                                            <!-- jsp connection and its code  -->
									        <%
									        ResultSet r = new conn().select("doctor");
									        if(id != 0){
									        	r = new conn().select("patient");
									        }
									        %>
                                            <tbody>
                                            <%while(r.next()){ 
                                            if(id == 0){ %>
                                                <tr>
                                                    <td><%out.print(r.getString(2).toUpperCase() + " " + r.getString(3).toUpperCase()); %></td>
                                                    <td><% out.print(r.getString(4));%></td>
                                                    <td>
                                                        <span><% out.print(r.getString(5));%></span>
                                                    </td>
                                                    <td><% out.print(r.getString(6));%></td>
                                                    <td><% out.print(r.getString(7));%></td>
                                                    <td><% out.print(r.getString(8));%></td>
                                                    <%
                                                    String query = "SELECT * FROM validate where did = " + r.getInt(1) + ";";

                                                	Statement st = con.createStatement();
                                                	ResultSet rs = st.executeQuery(query);
                                                	boolean status=true;
                                                	if (rs != null && rs.next()) {
                  		                	          status = rs.getBoolean("vali");
                  		                	    	}
                                                	if(status){
                                                    %>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i>Verified</td>
                                                    <% } else{ %>
                                                    <td><i class="fa fa-circle-o text-warning  mr-2"></i> Pending</td>	
                                                   <%  } %>
                                                </tr>
                                                <%}else{%>
                                                <tr>
                                                    <td><%out.print(r.getString(2).toUpperCase() + " " + r.getString(3).toUpperCase()); %></td>
                                                    <td><% out.print(r.getString(4));%></td>
                                                    <td>
                                                        <span><% out.print(r.getString(5));%></span>
                                                    </td>
                                                    <td><% out.print(r.getString(7));%></td>
                                                    <td><% out.print(r.getString(8));%></td>
                                                </tr>
                                                <% }}%>
                                            </tbody>
                                        </table>
                                </div>
                                <button id="btn" class="btn btn-primary px-3 mu-5">Generate</button>
                            </div>    
          				</div>
          			</div>
          		</div>
          	</div>
		  </div>

<!--**********************************
        Scripts
    ***********************************-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
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

	<script src="./assets/js/dashboard/printThis.js"></script>
	<script src="./assets/js/dashboard/custom.js"></script>
    <script src="./assets/js/dashboard/dashboard-1.js"></script>
</body>
</html>