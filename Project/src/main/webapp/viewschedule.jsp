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
                                                    <th>Date</th>
                                                    <th>Start Time</th>
                                                    <th>End Time</th>
                                                    <th>Average Consultancy Time</th>
                                                    <th>Break Start Time</th>
                                                    <th>Break Start Time</th>
                                                </tr>
                                            </thead>
                                            <!-- jsp connection and its code  -->
                                            <tbody>
												<tr>
											
									        <%
									        Connection con = new conn().connect();
									        Statement st = con.createStatement();
									        
									        try{
									        String query = "select * from schedule;";
									        ResultSet r = st.executeQuery(query);
									        
									        String date="",stime="",etime="",avg="",bst="",bet="";
									        //System.out.println(did);
									        while(r.next()){ 
									        	date = r.getString(2).toString();
									        	stime = r.getString(3).toString();
									        	etime = r.getString(4).toString();
									        	avg = r.getString(5);
									        	bst = r.getString(6).toString();
									        	bet = r.getString(7);
									        
									        	%>
									        		<td><% out.print(date); %></td>
                                                    <td><% out.print(stime); %></td>
                                                    <td><% out.print(etime); %></td>
                                                    <td><% out.print(avg); %></td>
                                                    <td><% out.print(bst);%></td>
                                                    <td><% out.print(bet); %></td>
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