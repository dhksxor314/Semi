<!-- 
페이지 : 로그아웃
작성자 : 전현영
설명 : 로그아웃 버튼을 누를시에 세션을 모두 invalidate함으로써 로그아웃시킨다.
	
 -->


<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	//로그아웃
	session.invalidate();
	response.sendRedirect("main.jsp");
%>
