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
		int did =0;
		if(session.getAttribute("id") != null){
			did = (Integer)session.getAttribute("id");	
		}
		if(email == null){
			response.sendRedirect("index.jsp");
		}
		%>
<jsp:include page="/includeheadside.jsp" />		
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
                                                    <th>Patient</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Past Disease</th>
                                                    <th>Date</th>
                                                    <th>Time</th>
                                                    <th>Permission</th>
                                                    <th>Payment</th>
                                                    <th>Prescription</th>
                                                </tr>
                                            </thead>
                                            <!-- jsp connection and its code  -->
                                            <tbody>
												<tr>
											
									        <%
									        Connection con = new conn().connect();
									        Statement st = con.createStatement();
									        
									        String fName="",lName="",Email="",phone="",dis="";
									        try{
									        String query = "select * from appointment FUll JOIN patient on patientId = patient.id where doctorId ="+did+";";
									        ResultSet r = st.executeQuery(query);
									        
									        Statement st1 = con.createStatement();
									        //System.out.println(did);
									        while(r.next()){
									        	int aid = r.getInt(1); 
									        	LocalDate date = LocalDate.parse(r.getString(4));
									        	String time = r.getString(5).toString();
									        	boolean status = r.getBoolean(6);
									        	boolean payment = r.getBoolean(7);
									        	fName = r.getString(9);
									        	lName = r.getString(10);
									        	phone = r.getString(12);
									        	dis = r.getString(15);
									        
									        	%>
									        		<td><% out.print(fName +" " + lName); %></td>
                                                    <td><% out.print(Email); %></td>
                                                    <td><% out.print(phone); %></td>
                                                    <td><% out.print(dis); %></td>
                                                    <td><% out.print(date);%></td>
                                                    <td><% out.print(time); %></td>
                                                    <% if(status){ %>
                                                    <td><a href="action.jsp?unUpdateAppointApprove=<%out.print(aid);%>" onclick="return takePermission()"><i class="fas fa-times"></i></a></td>
                                                    <% } else{ %>
                                                    <td><a href="action.jsp?appointApprove=<%out.print(aid);%>" onclick="return givePermission()"><i class="fas fa-lock-open"></i></a></td>	
                                                   <%  } %>
                                                   <% if(payment){ %>
                                                    <td>Paid</td>
                                                    <% } else{ %>
                                                    <td>pending</td>	
                                                   <%  } %>
                                                   <td><a href="createPrescription.jsp?aid=<%out.print(aid);%>"> <i class="fa fa-sticky-note"></i></a></td>
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
    <script type="text/javascript">
	
	function givePermission(){
		return confirm("Are you share you want to give the appointment.");
	}
	function takePermission(){
		return confirm("Are you share you want to deny for the appointment.");
	}
	</script>
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
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