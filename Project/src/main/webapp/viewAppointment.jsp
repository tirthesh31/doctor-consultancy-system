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
		<% 
		String email = (String)session.getAttribute("email");
		int pid =0;
		if(session.getAttribute("pid") != null){
			pid = (Integer)session.getAttribute("pid");	
		}
		if(email == null){
			response.sendRedirect("index.jsp");
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
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Doctor</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Profession</th>
                                                    <th>Date</th>
                                                    <th>Time</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <!-- jsp connection and its code  -->
                                            <tbody>
												<tr>
											
									        <%
									        Connection con = new conn().connect();
									        Statement st = con.createStatement();
									        int did=0,aid=0;
									        String fName="",lName="",Email="",phone="",prof="";
									        try{
									        String query = "select * from appointment FUll JOIN doctor on doctorId = doctor.id where patientId = "+pid+";";
									        ResultSet r = st.executeQuery(query);
									        
									        Statement st1 = con.createStatement();
									        //System.out.println(aid);
									        while(r.next()){
									        	aid = r.getInt(1);
									        	System.out.println(aid);
									        	LocalDate date = LocalDate.parse(r.getString(4));
									        	String time = r.getString(5).toString();
									        	boolean status = r.getBoolean(6);
									        	fName = r.getString(9);
									        	lName = r.getString(10);
									        	Email = r.getString(11);
									        	phone = r.getString(12);
									        	prof = r.getString(14);
									        	boolean payment = r.getBoolean(7);
									        	%>
									        		<td><% out.print(fName +" " + lName); %></td>
                                                    <td><% out.print(Email); %></td>
                                                    <td><% out.print(phone); %></td>
                                                    <td><% out.print(prof); %></td>
                                                    <td><% out.print(date); 
                                                    %></td>
                                                    <td><% out.print(time); %></td>
                                                    <% if(status && !payment){ %>
                                                    <td><a href="payment.jsp?aid=<%out.print(aid);%>" class="btn btn-primary">Please Pay</a></td>
                                                    <% }else if( status && payment){ %>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i>Accept</td>	
                                                    <% }else{ %>
                                                    <td><i class="fa fa-circle-o text-warning  mr-2"></i> Pending</td>	
                                                   <%  } %>
                                            	</tr>
                                            </tbody>
                                            <%
									        }
									        }catch(Exception e){
									        	System.out.print(e);
									        }
									        %>
                                        </table>
                                    </div>
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