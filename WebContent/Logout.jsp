<!-- 
������ : �α׾ƿ�
�ۼ��� : ������
���� : �α׾ƿ� ��ư�� �����ÿ� ������ ��� invalidate�����ν� �α׾ƿ���Ų��.
	
 -->


<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	//�α׾ƿ�
	session.invalidate();
	response.sendRedirect("main.jsp");
%>
