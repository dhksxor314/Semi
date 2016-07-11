<%--
페이지 - 마이페이지_참석자내역
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 참석자 출력 
 --%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@ page import="dto.MemberDto"%>
<%@ page import="dto.Speech_Meeting_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<title>Know-하우 Factory_active</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script>
	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
</head>
<body>
	<%!int totalRecord_o = 0;
	int totalRecord = 0;
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
		Vector<MemberDto> list = dao.SpeakerParticipantList(Integer.parseInt(mem_num));
		

		totalRecord = list.size();
		
		
		totalPage = ((int) Math.ceil((double) totalRecord / numPerPage));

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
				<img src="upload/${loginImage }"width="110" height="110">
				<h4>${loginName }</h4>
			<br/><br/>
				<ul class="nav nav-list span2">
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=speaker_open">활동내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=speaker_update">정보수정</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=speaker_leave">회원탈퇴</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container" id="main1">
		<div class="span9">
			<ul class="nav nav-pills nav-stacked" id="menu">
				<li class="active"><a href="#" id="btn">개설내역</a></li>
			</ul>
		</div>

		<!-- 참여자 명단 -->
		<div class="span9">
			<table class="div-table table bsk-tbl bg-white">
				<caption style="text-align: left; margin-bottom: 15px">
				<%
					if (list.size() == 0) {				
				%>
				<strong>참가 0 명</strong> / 정원  <%=session.getAttribute("max") %> 명
				<%
					}else if (list.size() > 0) {
							for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
								if (i == 1)
									break;

								MemberDto dto = list.get(i);

								int max = dto.getMax_person();
					%>
					<strong>참가 <%=totalRecord%> 명</strong> / 정원 <%=max%> 명
				</caption>
				<%
					}
				}
				%>
				<thead>
					<tr class="bg-black">
						<th><strong>이름</strong></th>
						<th><strong>이메일</strong></th>
						<th><strong>연락처</strong></th>
						<th><strong>비고</strong></th>
					</tr>
				</thead>
				<%
					if (list.size() == 0) {
				%>
				<tr>
					<td colspan="9" style="text-align: center"><h5>
							<br /> <br />현재 참여한 인원이 없습니다.<br /> <br />
						</h5></td>
				</tr>
				<%
					} else {
						for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
							if (i == totalRecord)
								break;

							MemberDto dto = list.get(i);
				%>
				<tbody>
					<tr>
						<td><%=dto.getName()%></td>
						<td><%=dto.getEmail()%></td>
						<td><%=dto.getPhone()%></td>
						<td></td>
					</tr>
				</tbody>
				<%
					}
					}
				%>
			</table>
		</div>
	</div>
<br/><br/><br/><br/>
	<div class="check" align="center">
		<p>
			<button class="btn btn-primary" data-dismiss="modal">확인</button>
			<a href="/KnowHowFactory/main.jsp" class="btn">취소</a>
		</p>
	</div>
<br/><br/><br/>
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>