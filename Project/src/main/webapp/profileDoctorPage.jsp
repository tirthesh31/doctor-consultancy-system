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
		<%@page import = "java.time.temporal.ChronoUnit"%>
		<% 
		LocalDateTime now = LocalDateTime.now();
		
		int updated;
		
		String email = (String)session.getAttribute("email");		
		if(email == null){
			response.sendRedirect("index.jsp");
		}else if(session.getAttribute("adminid") != null){%>			
			<jsp:include page="/includeAdminHeadside.jsp"/> 
		<% } else if(session.getAttribute("id") != null){%>
			<jsp:include page="/includeheadside.jsp"/>
			<% } else if(session.getAttribute("pid") != null){ %>
			<jsp:include page="/includePatientHeadside.jsp"/>
			<% } %>
			    
		<% 
		int id=0;
		Connection con = new conn().connect();
		String fname = "",lname="",Email="",profession="",years="";
		String contact="";
		if(request.getParameter("id")!=null){
			id = Integer.parseInt(request.getParameter("id"));
			
			ResultSet rs3 = con.createStatement().executeQuery("select * from doctor where id= "+id+";");
			if(rs3.next()){
				fname=rs3.getString(2);
				lname=rs3.getString(3);
				Email=rs3.getString(4);
				contact = rs3.getString(5);
				profession = rs3.getString(6);
				years = rs3.getString(7);
			}
		}
		%>
		
		
          <!--**********************************
            Table Content
        ***********************************-->
          <div class="content-body">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-xl-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="media align-items-center mb-4">
                                    <img class="mr-3" src="images/avatar/11.png" width="80" height="80" alt="">
                                    <div class="media-body">
                                        <h3 class="mb-0"><%out.print(fname + " " + lname); %></h3>
                                    </div>
                                </div>
                                
                                <div class="row mb-5">
                                    <div class="col">
                                        <div class="card card-profile text-center">
                                            <span class="mb-1 text-warning"><i class="icon-user-follow"></i></span>
                                            <h3 class="mb-0">263</h3>
                                            <p class="text-muted">Followers</p>
                                        </div>
                                    </div>
                                    <div class="col-12 text-center">
                                        <button class="btn btn-danger px-5 mb-2">Follow Now</button>
                                        <a href = "makeAppointment.jsp?id=<%out.print(id);%>" class="btn btn-primary px-3" >Make an Appointment</a>
                                    </div>
                                </div>

                                <h4>About Me</h4>
                                <p class="text-muted">Hi, I'm <%out.print(fname + " " + lname); %>, by profession, I am in a <%out.print(profession); %> and have a experience of more than <%out.print(years); %></p>
                                <ul class="card-profile__info">
                                    <li class="mb-1"><strong class="text-dark mr-4">Mobile</strong> <span><%out.print(contact); %></span></li>
                                    <li><strong class="text-dark mr-4">Email</strong> <span><%out.print(email); %></span></li>
                                </ul>
                            </div>
                        </div>  
                    </div>
                    <!-- Blog Section -->
                    <div class="col-lg-8 col-xl-9">
                        <div class="card">
                            <div class="card-body">                   
                             <h2 class="mb-4"> <span class="badge badge-primary h-25">Blogs</span></h2>	
	                            
	                            <%
	                            String bTitle="",bDesc="";
	                            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
	                    		
	                    		String query = "SELECT * FROM blogs where did = " + id +" ORDER BY id DESC LIMIT " + 4 + ";";
								
	                    		Statement st = con.createStatement();
	                    		ResultSet rs = st.executeQuery(query);

	                            while(rs.next()){
	                            	bTitle = rs.getString(3);
	                            	bDesc = rs.getString(4);
	                            	String tDays = rs.getDate(5).toString();
	                            	
	                            	
	                            %>
	                            <div class="media media-reply">
	                            	<div class="media-body ">
	                                    <div class="d-sm-flex justify-content-between mb-2">
	                                        <h5 class="mb-sm-0"><%out.print(bTitle); %> <small class="text-muted ml-3">Posted on <%out.print(tDays);%></small></h5>
	                                    </div>
	                                    <p><% out.print(bDesc);%></p>
	                                </div>
	                            </div>
	                                <% } %>
                             </div>
                        </div>
                    </div>
                    <!-- Review Section -->
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body">         
                            <h2 class="mb-4"> <span class="badge badge-primary h-25">Review</span></h2>
                            <%
	                            
	                    		
	                    		String query1 = "SELECT * FROM review JOIN patient ON pid=patient.id  where review.did = "+id+" ORDER BY id DESC LIMIT 4 ;";
								
	                    		Statement st1 = con.createStatement();
	                    		ResultSet rs1 = st.executeQuery(query1);

	                            while(rs1.next()){
	                            	String name = rs1.getString(7) + " "+ rs1.getString(8);
	                            	String pre = rs1.getString(4);
	                            	String tDays = rs1.getDate(5).toString();
	                            	
	                            	
	                            %>                   
	                            <div class="media media-reply">
	                                <div class="media-body">
	                                    <div class="d-sm-flex justify-content-between mb-2">
	                                        <h5 class="mb-sm-0"> <%out.print(name); %><small class="text-muted ml-3"><%out.print(tDays); %></small></h5>
	                                    </div>
	                                    <p><%out.print(pre); %></p>
	                                </div>
	                            </div>
	                            <% } %>
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