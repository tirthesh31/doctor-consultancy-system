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
                                <div class="active-member">
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
                                            <thead>
                                                <tr>
                                                    <th>New Doctor</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Degree</th>
                                                    <th>Profession</th>
                                                    <th>Experience</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <!-- jsp connection and its code  -->
									        <%
									        Connection con = new conn().connect();
									        ResultSet r = new conn().select("doctor");
									        %>
                                            <tbody>
                                            <%while(r.next()){%>
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
                                                    <td><a href="action.jsp?unupdateid=<%out.print(r.getInt(1));%>" onclick="return takePermission()"><i class="fas fa-times"></i></a></td>
                                                    <td><a href="action.jsp?deleteid=<%out.print(r.getInt(1));%>" onclick='return checkdelete()'><i class="fas fa-trash"></i></a></td>
                                                    <% } else{ %>
                                                    <td><a href="action.jsp?updateid=<%out.print(r.getInt(1));%>" onclick="return givePermission()"><i class="fas fa-lock-open"></i></a></td>	
                                                   <%}%>
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
	<script type="text/javascript">
	function checkdelete(){
		return confirm("Are you share you want to delete the records.");
	}
	function givePermission(){
		return confirm("Are you share you want to give the access.");
	}
	function takePermission(){
		return confirm("Are you share you want to take back the access.");
	}
	</script>
<!--**********************************
        Scripts
    ***********************************-->
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