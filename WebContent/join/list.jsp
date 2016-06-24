<%@page import="java.net.URLEncoder"%>
<%@page import="join.listDao"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		Vector<join.listDto> vector = new Vector<join.listDto>();
		listDao dao = new listDao();
		String region=null;
		if(request.getParameter("region")==null){
			region="0";
		}else{
			region=(String)request.getParameter("region");
		}
		
		vector = dao.getList(region);
	%>
	<script>
		$(document).ready(function() {
			$("#region").change(function() {
				$("#form").submit();
			})
		})
	</script>
	<%@ include file="../include/header.jsp"%>

	<div class="content">
		<div
			style="width: 100%; padding: 20px 0; background-color: #ebebeb; border-bottom: 1px solid #ddd;">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div style="margin-bottom: 15px;">
							<h4>참가하기</h4>
						</div>
						<form name="form" id="form" action="control" method="post">
							<input type="hidden" id="cmd" name="cmd" value="joinlist"/>
							<div class="pull-left">
								<div class="inline">
									<select id="region" name="region"
										class="form-control selectNavigation"
										style="width: 120px; padding-left: 5px; margin-right: 10px;">
										<option value="0" <%if (region.equals("0")) {%>selected="selected" <%}%>>모든지역</option>
										<option value="서울" <%if (region.equals("서울")) {%>selected="selected" <%}%>>서울</option>
										<option value="대전" <%if (region.equals("대전")) {%>selected="selected" <%}%>>대전</option>
										<option value="대구" <%if (region.equals("대구")) {%>selected="selected" <%}%>>대구</option>
										<option value="부산" <%if (region.equals("부산")) {%>selected="selected" <%}%>>부산</option>
										<option value="제주" <%if (region.equals("제주")) {%>selected="selected" <%}%>>제주</option>
										<option value="기타" <%if (region.equals("기타")) {%>selected="selected" <%}%>>기타</option>
									</select> 에서 열리는 만남
								</div>
							</div>
						</form>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 20px;"></div>
	<div class="container">
		<div class="row">
			<%
				for (int i = 0; i < vector.size(); i++) {
					String name = vector.get(i).getImage();
			%>
			<div class="span3" style="border: 1px solid black;">
				<a href="control?cmd=info&num=<%=vector.get(i).getNum()%>"> <img
					src="/upload/<%=name%>" /></a><br> <a
					href="control?cmd=info&num=<%=vector.get(i).getNum()%>"> <%=vector.get(i).getTitle()%>
				</a><br>
				<div style="height: 20px;"></div>
				<span class="fst"><%=vector.get(i).getReporting_date().substring(0, 10)%></span>
				<span class="tnd"></span> <span class="pull"><i
					class="fa fa-map-marker"></i>&nbsp;&nbsp;<%=vector.get(i).getRegion()%></span>
				<div class="clear"></div>
				<span class="name"><%=vector.get(i).getName()%></span>
				<div class="clear"></div>
				<%
					if (vector.get(i).getMax_person() < vector.get(i).getNow_person()) {
				%>
				<span style="font-weight: bold; color: #F35A55;"> <%=vector.get(i).getMax_person()%>명
					참여
				</span> <span style="font-weight: bold; color: #F35A55;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대기
					<%=vector.get(i).getNow_person() - vector.get(i).getMax_person()%>명
				</span>
				<%
					} else {
				%>
				<span style="font-weight: bold; color: #F35A55;"> <%=vector.get(i).getNow_person()%>명
					참여
				</span>
				<%
					}
				%>
				<div class="pull-right">
					<span>총 <%=vector.get(i).getMax_person()%>명 만남
					</span>
				</div>
				<div class="clear"></div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>