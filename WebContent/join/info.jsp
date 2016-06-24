<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="join.listDto"%>
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

<script>
	$(document).ready(function() {
		var jbOffset = $('.jbMenu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() >= jbOffset.top) {
				$('.jbMenu').addClass('jbFixed');
			} else {
				$('.jbMenu').removeClass('jbFixed');
			}
		});

		$("#join").click(function() {
			if($("#progression").val()=="모집마감"){
					alert("모집마감된 만남입니다.");	
			}else{
				if($("#check").val()=="n"){
					alert("이미 참가중인 만남입니다.");	
				}else{
					$("#infonum").submit();
				}
			}
		});
	});
</script>
<script>
	function startTime() {
		if (document.getElementById("date1").value >= document
				.getElementById("date2").value) {
			if (document.getElementById('text2').value > document
					.getElementById('start').value) {
				fnTempList();
			}
		}
	}
	window.onload = function() {
		startTime();
	}
</script>
<script src="/join/ajax.js"></script>
<script>
	var httpRequest = null;

	function fnTempList() {
		var param = "cmd=update&num=" +
<%=request.getParameter("num")%>
	;
		sendRequest("GET", "control", param, callback)
	}

	function callback() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

			} else {
				alert(httpRequest.status);
			}
		}
	}
</script>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	int num = Integer.parseInt((String)request.getAttribute("num"));
	int loginMem_num = Integer.parseInt(String.valueOf(session.getAttribute("loginMem_num")));
	listDao dao = new listDao();
	listDto dto = dao.getinfo(num);
	String check = dao.getsearch(num, loginMem_num);
	String reporting_date = dto.getReporting_date().substring(0, 10);
	String strdate=(String)request.getAttribute("strdate");
	String today=(String)request.getAttribute("today");
	%>
	<input type="hidden" id="date1" name="date1" value="<%=strdate%>" />
	<input type="hidden" id="date2" name="date2" value="<%=reporting_date%>" />
	<input type="hidden" id="text2" name="text2" value="<%=today%>" />
	<input type="hidden" id="start" name="start"
		value="<%=dto.getStarttime()%>" />
	<input type="hidden" id="check" name="check" value="<%=check%>" />
	<input type="hidden" id="progression" name="progression" value="<%=dto.getProgression()%>"/>
	
	<%@ include file="../include/header.jsp" %>
	
	<div class="row main-div">
		<div class="col-md-12 main-background" style="text-align: center">
			<div id="carousel-example-generic" class="carousel slide">
				<div class="carousel-inner">
					<div id="meeting-img-web" class="item active meeting-img">
						<p style="text-align: center">
							<img src="/upload/<%=dto.getImage()%>" class="meeting-bg" />
					</p>
							<div class="carousel-caption container-fluid">
							<div class="col-md-1"></div>
							<div class="col-md-10 col-xs-12">
								<p class="meeting-title"><%=dto.getTitle()%></p>
							</div>
							<div class="col-md-1"></div>
						</div>
					
						</div>
					<div class="meeting-img-shadow-top"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="jbMenu">
		<div class="row">
			<div class="span3" style="margin-left: 13%">
				<%=reporting_date%><br />
				<%=dto.getStarttime()%>
				~
				<%=dto.getEndtime()%>
			</div>
			<div class="span3">
				<%=dto.getRegion()%><br><%=dto.getPlace_addr()%>(<%=dto.getPlace_name()%>)
			</div>
			<div class="span3">
				<%
					if (dto.getMax_person() < dto.getNow_person()) {
				%>
				<%=dto.getMax_person()%>명 참여<br>
				<%=dto.getNow_person() - dto.getMax_person()%>명 대기<br>
				<%
					} else {
				%>
				<%=dto.getNow_person()%>명 참여<br>
				<%
					}
				%>
				총
				<%=dto.getMax_person()%>명 만남 <br /> 최소<%=dto.getMin_person()%>명 필요
			</div>
			<div class="span3">
				만남 2시간 전까지<br />
				<%
				if(dto.getPrice()==0){%>
					무료
				<% }else{%>
				<%=dto.getPrice() %>
				<%} %>
			</div>
			<div class="span3">
				<button type="button" id="join"
					class="btn btn-danger btn-lg btn-block  join-btn">참가하기</button>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="tabbable tab-below">
				<!-- tabbable은  탭 제목과 컨텐츠를 한번에 묶어주는 역할, tab-below는 탭 아래 내용이 나오게끔 -->
				<ul class="nav nav-tabs">
					<!-- 탭 메뉴로 탐색할 수 있게 만들어줌 -->
					<li class="active"><a href="#tab1" data-toggle="tab">만남 내용</a></li>
					<!-- data-toggle은 탭을 눌렀을 때 동작할 수 있게 해줌 -->
					<li><a href="#tab2" data-toggle="tab">후기</a></li>
					<!-- active는 미리 선택되어 있도록 활성화 시켜놓음 -->
				</ul>
				<div class="tab-content">
					<!-- 탭에 해당하는 내용이 나올 부분 / 각 탭을 식별할 아이디를 지정 -->
					<div class="tab-pane active" id="tab1">
						<%=dto.getDescription()%>
						<h4>모임장 소개</h4>
						<strong>직업 : </strong><%=dto.getJob() %><br>
						<strong>자기 소개 : </strong><%=dto.getIntro() %><br>
						<br><br><br>
					</div>
					<div class="tab-pane" id="tab2">
						<div class="tab-pane" id="review">
							<div style="margin-bottom: 15px; text-align: right;">
								<a href="/17152/write-review" class="btn btn-info btn-sm">후기
									남기기</a>
							</div>
							<div class="table-responsive">
								<table class="table board">
									<tr>
										<td colspan="3"
											style="text-align: center; height: 100px; border-top: 0px;"
											valign="middle">아직 작성된 글이 없습니다.</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>
	<form action="control" method="POST" name="infonum" id="infonum">
		<input type="hidden" name="cmd"	id="cmd" value="join"/>
		<input type="hidden" name="num" id="num" value="<%=dto.getNum()%>" />
	</form>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>