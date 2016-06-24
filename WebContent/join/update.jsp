<%@page import="update.update"%>
<%@page import="dbcp.DBConnectionMgr"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	
	update update=new update();
	update.update(num);
	
	response.sendRedirect("control?cmd=join&num="+num);
%>