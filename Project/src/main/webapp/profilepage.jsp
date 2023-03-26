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
		}else if(email.equals("tirtheshmotiwala@gmail.com")){%>			
			<jsp:include page="/includeAdminHeadside.jsp"/> 
		<% } else if(session.getAttribute("id") != null){%>
			<jsp:include page="/includeheadside.jsp"/>
			<% } else if(session.getAttribute("pid") != null){ %>
			<jsp:include page="/includePatientHeadside.jsp"/>
			<% } %>
		
		    
          <!--**********************************
            Table Content
        ***********************************-->
          <div class="content-body">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                            <%if(email.equals("admin@gmail.com")){ %>
                            
                                <div class="media align-items-center mb-4">
                                    <img class="rounded-circle" src="./assets/images/avatar/tirthesh.jpg" width="80" height="80" alt="">
                                    <div class="media-body">
                                        <h3 class="mb-0 ml-3">TIRTHESH MOTIWALA</h3>
                                        <p class="text-muted mb-0 ml-3">Canada</p>
                                    </div>
                                </div>
                                <h4>About Me</h4>
                                <p class="text-muted">Hi, I'm TIRTHESH, IT HEAD OF THIS COMPANY.</p>
                                <ul class="card-profile__info">
                                    <li class="mb-1"><strong class="text-dark mr-4">Mobile</strong> <span>8980459949</span></li>
                                    <li><strong class="text-dark mr-4">Email</strong> <span>admin@gmail.com</span></li>
                                </ul>
                                <%}%> 
                            </div>
                        </div>  
                    </div>
                 </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
	</div>	
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