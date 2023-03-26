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
		}else if(session.getAttribute("adminid") != null){%>			
			<jsp:include page="/includeAdminHeadside.jsp"/> 
		<% } else if(session.getAttribute("id") != null ){%>
			<jsp:include page="/includeheadside.jsp"/>
			<% } else if(session.getAttribute("pid") != null ){ %>
			<jsp:include page="/includePatientHeadside.jsp"/>
			<% } System.out.println(session.getAttribute("pid"));%>
			 
	<!--**********************************
            Table Content
        ***********************************-->
        <div class="content-body">
			<div class="container-fluid mt-3">
				<div class="row">
				<!-- jsp connection and its code  -->
									        <%
									        Connection con = new conn().connect();
									        ResultSet r = new conn().select("doctor");
									        while(r.next()){
									        %>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="assets/images/avatar/doctor.png" width="80" height="80" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1"><%out.print(r.getString(2) + " "  + r.getString(3));%></h5>
                                    <p class="m-0"><%out.print(r.getString(7));%></p>
                                    <a href="profileDoctorPage.jsp?id=<%out.print(r.getString(1));%>" class="btn btn-primary mt-4">View Profile</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
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