<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- importing jsp libraries --> 
		<%@page import="java.sql.*"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.SQLException"%>
		<%@page import="com.connect.conn"%>
		<%@page import = "java.util.* "%>
		<%@page import = "java.util.Date "%>
		<%@page import = "java.time.format.DateTimeFormatter"%>
		<%@page import = "java.time.LocalDate"%>
		<%@page import = "java.time.LocalTime"%>
		<%@page import = "java.time.format.DateTimeFormatter"%>
<%
System.out.println("hii1");
if(request.getParameter("dDate") != null){
	
	LocalDate date = LocalDate.parse(request.getParameter("dDate"));
	
	int id=0;
	System.out.println("hii2");
	if(session.getAttribute("did")!=null){
		id = (Integer)session.getAttribute("did");
		System.out.println("hii3");
		try{
			Connection con = new conn().connect();
			String query = "SELECT * FROM schedule where did = " + id + " and sdate = '" +date+ "';";
	
	    	Statement st = con.createStatement();
	    	ResultSet rs = st.executeQuery(query);
	    	 
	    	LocalTime startTime=LocalTime.now();
	    	LocalTime tempStartTime=LocalTime.now();
	    	LocalTime tempEndTime = LocalTime.now();
	    	LocalTime endTime = LocalTime.now();
	    	LocalTime avoidStartTime =LocalTime.now();
	    	LocalTime avoidEndTime =LocalTime.now();
	    	long avgConusltancyTime=30;
	    	
	    	System.out.println("hii4");
	    	System.out.println(date);
	    	if (rs != null && rs.next()) {
	    		System.out.println("hii6");
	    		startTime = LocalTime.parse(rs.getString(3));
	    		endTime = LocalTime.parse(rs.getString(4));
	    		avgConusltancyTime = rs.getInt(5);
	    		avoidStartTime = LocalTime.parse(rs.getString(6));
	    		avoidEndTime = LocalTime.parse(rs.getString(7));
		    	int flag=0;
		    	while(startTime != endTime){
		    		tempStartTime = startTime;
		    		tempEndTime = tempStartTime.plusMinutes(avgConusltancyTime);
		    		if(tempStartTime == avoidStartTime){
		    			flag =1;
		    		}else if(flag == 0){
		    			out.print("<option value="+tempStartTime+"-"+tempEndTime+">"+tempStartTime+"-"+tempEndTime+"</option>");
		    		}else if(tempEndTime == avoidEndTime){
		    			flag = 0;
		    		}
		    		startTime = tempStartTime.plusMinutes(avgConusltancyTime);
		    	}
		    	
	    	}else{
	    		System.out.println("h");
	    		out.print("<option value="+"'9:00 - 10:00'"+">9:00 - 10:00</option>");
	    		out.print("<option value="+"'10:00 - 11:00'"+">10:00 - 11:00</option>");
	    		out.print("<option value="+"'12:00 - 1:00'"+">12:00 - 1:00</option>");
	    		out.print("<option value="+"'2:00 - 3:00'"+">2:00 - 3:00</option>");
	    		out.print("<option value="+"'3:00 - 4:00'"+">3:00 - 4:00</option>");
	    		out.print("<option value="+"'4:00 - 5:00'"+">4:00 - 5:00</option>");
	    		
	    	}
		}catch(Exception e){
			System.out.print(e);
		}
	}
}
%>
</body>
</html>