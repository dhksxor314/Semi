<%@page import="dao.SpeakerDao"%>
<%@page import="java.util.Vector"%>
<%@page import="dto.SpeakerDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<body>
<%!int totalRecord = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		SpeakerDao dao = new SpeakerDao();

		Vector<SpeakerDto> list=dao.getFindSpeakerList();
		System.out.println(list.size());
		
	%>
<div class="container">
		<div class="row">
			<div class="span12">
	<table
		class="table table-bordered table-hover table-striped table-condensed">
		<thead>
			<tr>
				<th>강연자번호</th>
				<th>이름</th>
				<th>분야</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
			<%
				if (list.size() == 0) {
			%>
			<tr>
				<td colspan="8" align="center">데이터 없음</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < list.size(); i++) {
						if (i == list.size())
							break;

						SpeakerDto dto = list.get(i);
			%>

			<tr>
				<td><%=dto.getSpeaker_num()%></td>
				<td><a href="javascript:opener.document.f.inputName.value='<%=dto.getName()%>';self.close()"><%=dto.getName()%></a></td>
				<td><%=dto.getField()%></td>
				<td><%=dto.getEmail()%></td>				
				<td><%=dto.getPhone()%></td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>

	</div>
</div>
</div>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>