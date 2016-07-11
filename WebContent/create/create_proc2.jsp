<%@page import="create.placeDto"%>
<%@page import="create.createDao"%>
<%@page import="create.createDto"%>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	createDao dao = new createDao();
	placeDto dto=new placeDto();
	int place_num = Integer.parseInt(request.getParameter("place_num"));
	dto=dao.getplace2(place_num);
	out.println("<place><name>"+dto.getPlace_name()+"</name><addr>"+dto.getAddress()+"</addr></place>");
	

%>
