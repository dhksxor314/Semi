<%--
페이지 - 마이페이지_개설내역
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 개설 출력 / 주석처리_로그인한 회원번호를 받아와야한다.
 --%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Speech_Meeting_Dto"%>
<%@ page import="dto.Participation_Dto" %>
<%@page import="java.util.Vector"%>
<%@page import="javax.servlet.http.HttpSession"  %>
<!DOCTYPE html>
<html>
<head>
<title>Know-하우 Factory_active</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="../bootstrap/js/holder.js"></script>
<script>
	$(document).ready(
			function() {

				$("#all").click(
						function() {
							if ($("#all").is(":checked")) {
								$('input:checkbox[name=check]:not(checked)')
										.prop("checked", true);
							} else {
								$('input:checkbox[name=check]:checked').prop(
										"checked", false);
							}
						});

				$("#req").click(function(){
					if ($("input:checked").length > 0) {
						return true;
					}else{
						alert("폐강할 모임을 선택해주세요.");
						return false;
					}
				})				
				$("#delBtn").click(function() {
					$("#f").submit();
				});
			});

	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>

<!-- Custom CSS -->
<link href="../../../style.css" rel="stylesheet">

</head>
<body>
	<%!
	int totalRecord_o = 0;
	int totalRecord_c = 0;
	int bmcount = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>

	<jsp:useBean id="dao_b" class="dao.BookmarkDao" />
	<jsp:useBean id="dao" class="dao.ActiveDao" />
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));			
		Vector<Speech_Meeting_Dto> list_o = dao.SpeakerOpenList(Integer.parseInt(mem_num));		
		Vector<Participation_Dto> list_c = dao.CompleteList(Integer.parseInt(mem_num));
		
		System.out.println(session.getAttribute("loginImage"));
		
		totalRecord_o = list_o.size();
		totalRecord_c = list_c.size();

		String count_o = Integer.toString(totalRecord_o);
		String count_c = Integer.toString(totalRecord_c);

		totalPage = ((int) Math.ceil((double) totalRecord_o / numPerPage));

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));

		beginPerPage = nowPage * numPerPage;
	%>

	<!-- header -->
	<%@ include file="../../../include/header.jsp"%>

	<!-- main -->
	<div id="sidebar">
		<div class="span3">
			<div align="center">
					<img src="/upload/${loginImage }" width="110" height="110">
				<h4>${loginName }</h4>
				<br/><br/>
				<ul class="nav nav-list span2">
					<li class="active"><a href="front?cmd=speaker_open">개설내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=speaker_update">정보수정</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=speaker_leave">회원탈퇴</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="speaker_open" />

		<div class="container" id="main1">
			<div class="span9">
				<ul class="nav nav-pills nav-stacked" id="menu">
					<li class="active"><a href="#" id="btn">개설내역</a></li>
				</ul>
			</div>
			<div class="span9">
				<ul class="nav nav-tabs">
					<li class="active"><a href="front?speaker_open">개설한 강연 <span
							class="badge badge-info"><%=count_o%></span></a></li>
					<li><a href="front?cmd=speaker_complete">완료된 강연<span
							class="badge"><%=count_c%> </span></a></li>
				</ul>
			</div>

			<div class="span9">
				<div class="well">
					<table class="div-table table bsk-tbl bg-white">
						<thead>
							<tr class="bg-black">
								<th><input type="checkbox" id="all"></th>
								<th style="width: 180px"><strong>이미지</strong></th>
								<th style="width: 150px"><strong>제목</strong></th>
								<th><strong>정원</strong></th>
								<th><strong>날짜</strong></th>
								<th><strong>장소</strong></th>
							</tr>
						</thead>
						<tbody>
							<%
								if (list_o.size() == 0) {
							%>
							<tr>
								<td colspan="9" style="text-align: center"><h5>
										<br />현재 개설된 모임이 없습니다.
									</h5></td>
							</tr>
							<%
								} else {
									for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
										if (i == totalRecord_o)
											break;

										Speech_Meeting_Dto dto = list_o.get(i);
							%>
							<tr>
								<td><input type="checkbox" name="check"
									value="<%=dto.getNum()%>" />
								<td class="text-center">
									<div class="item-img">
										<img src="upload/<%=dto.getImage()%>" width="110" height="110" alt="">
									</div>
								</td>
								<td><a href="#"><b><%=dto.getTitle()%></b> </a></td>
								<td><a href="front?cmd=speaker_participant"><%=dto.getNow_person()%></a>
									/ <%=dto.getMax_person()%>
								<%int max = dto.getMax_person();
								session.setAttribute("max", max); %></td>
								<td><%=dto.getReporting_date()%></td>
								<td><%=dto.getPlace_name()%>
									<div class="modal hide fade" id="cencle">
										<div class="modal-header">
											<a href="#" data-dismiss="modal"></a>
											<h4><%=dto.getTitle()%>&nbsp;를 폐강하시겠습니까?
											</h4>
										</div>
										<div class="modal-body">
											<p style="text-align: left">
												1. 폐강신청은 <strong><font class="cencel">만남 하루
														전까지만</font></strong>&nbsp;가능합니다.
											</p>
											<p style="text-align: left">2. 폐강된 모임은 다시 개설할 수 없으니 주의
												부탁드립니다.</p>
											<p style="text-align: left">3. 모임 당일오전 8시에 최소 인원 미달 시 취소될
												수 있습니다.</p>
										</div>
										<div class="modal-footer">
											<button class="btn btn-primary" data-dismiss="modal"
												id="delBtn">확인</button>
											<button class="btn" data-dismiss="modal">닫기</button>
										</div>
									</div></td>
							</tr>
						</tbody>
						<%
							}
							}
						%>
					</table>
				</div>
			</div>
		</div>
		<div class="check" align="center">
			<p>
				<button class="btn btn-warning" data-target="#cencle"
					data-toggle="modal" id="req">폐강 신청</button>
				<a href="../../main.jsp" class="btn">취소</a>
			</p>
		</div>
	</form>
<br/><br/><br/>	
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>