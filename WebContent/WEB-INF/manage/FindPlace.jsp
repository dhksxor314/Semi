<%@page import="dto.PlaceDto"%>
<%@page import="dao.PlaceDao"%>
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

		PlaceDao dao = new PlaceDao();

		Vector<PlaceDto> list=dao.getPlaceList();
		System.out.println(list.size());
		
	%>
<div class="container">
		<div class="row">
			<div class="span12">
	<table
		class="table table-bordered table-hover table-striped table-condensed">
		<thead>
			<tr>
				<th>장소번호</th>
				<th>이름</th>
				<th>수용인원</th>
				<th>주소</th>
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

						PlaceDto dto = list.get(i);
			%>

			<tr>
				<td><%=dto.getPlace_num()%></td>
				<td><a href="javascript:opener.document.f.inputPlace.value='<%=dto.getPlace_name()%>';self.close()"><%=dto.getPlace_name()%></a></td>
				<td><%=dto.getCapacity()%></td>			
				<td><%=dto.getAddress()%></td>
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