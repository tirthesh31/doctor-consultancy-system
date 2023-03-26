<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String email = (String)session.getAttribute("email");
if(email != null){
	session.removeAttribute("email");
	response.sendRedirect("index.jsp");
}
%>