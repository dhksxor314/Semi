<%@page import="dao.PointDao"%>
<%@page import="dto.MemActivityDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="dto.Speech_Meeting_Dto"%>
<%@ page import="dto.Point_Dto"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script>
	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<!-- Custom CSS -->
<link href="../style.css" rel="stylesheet">

</head>
<body>
	<%!int totalRecord = 0;
	int bmcount = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>

	<jsp:useBean id="dao_b" class="dao.BookmarkDao" />
	<jsp:useBean id="dao" class="dao.PointDao" />

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));	
		Vector<MemActivityDto> list = dao.getActivityList("null", "null", "null",Integer.parseInt(mem_num));
		totalRecord = list.size();

		//즐겨찾기 개수		
		
		Vector<Bookmark_Dto> list_b = dao_b.BookmarkList(Integer.parseInt(mem_num));
		bmcount = list_b.size();

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
				<img src="/upload/${loginImage }" width="110" height="110">
				<h4>${loginName }</h4>
				<form class="form-horizontal">
					<div class="control-group">
						<h5 style="margin-bottom: -50px;">
							쪽지함&nbsp;&nbsp;<input type="button"
								class="icon-envelope icon-white" onclick="fnMessage()" />&nbsp;&nbsp;
							즐겨찾기&nbsp;<a href="front?cmd=bookmark"><%=bmcount%></a>
						</h5>
					</div>
					<br />
				</form>
				<ul class="nav nav-list span2">
					<li class="divider"></li>
					<li><a href="front?cmd=speech">활동내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=cart">장바구니</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=bookmark">즐겨찾기</a></li>
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=point">포인트내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=payment">결제내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=update">정보수정</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">회원탈퇴</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container" id="main1">
		<div class="span9">
			<ul class="nav nav-pills nav-stacked" id="menu">
				<li class="active"><a href="#" id="btn">포인트내역</a></li>
			</ul>
		</div>

		<div class="span9">
			<table class="div-table table bsk-tbl bg-white">
				<thead>
					
					<tr class="bg-black">
						<th><strong>내용</strong></th>
						<th><strong>적립</strong></th>
						<th><strong>사용</strong></th>
						<th><strong>날짜</strong></th>
					</tr>
				</thead>
				<tbody>
					<%
						if (list.size() == 0) {
					%>
					<tr>
						<td colspan="9" style="text-align: center"><h5>
								<br />포인트 내역이 없습니다.
							</h5></td>
					</tr>

					<%
						} else {
							for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
								if (i == totalRecord)
									break;

								MemActivityDto dto = list.get(i);
					%>
					<tr>
						<td class="text-center">
							<%
								int part_num = dto.getPart_num();
										int post_num = dto.getPost_num();
										String saving = null;
										if (part_num != 0) {
											saving = "만남참여";
										} else if (post_num != 0) {
											saving = "후기작성";
										}
							%> <%=saving%></td>
						<td class="text-center"><%=dto.getPoint()%></td>
						<td class="text-center"><%=dto.getUsedpoint() %></td>
						<td class="text-center"><%=dto.getReporting_date()%></td>
					</tr>
				</tbody>
				<%
					}
					}
				%>
				<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<%PointDao dao1=new PointDao();
					MemActivityDto dto2=dao1.getActivityList2(Integer.parseInt(mem_num));
					%>
					<td>합계 : <%=dto2.getPoint2() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="pagination span9" style="text-align: center; margin-top: 380px" >		
			<ul>
				<%
					if (nowBlock > 0) {
				%>
				<li><a href="javascript:ch(0, 0)">이전 <%=pagePerBlock%>개
				</a></li>

				<%
					}
				%>

				<%
					for (int i = 0; i < pagePerBlock; i++) {
						if ((nowBlock * pagePerBlock) + i == totalPage) {
							break;
						}
				%>

				<li><a href="javascript:ch(<%=i%>, 1)"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
				<%
					}
				%>
				<%
					if (totalBlock > nowBlock + 1) {
				%>
				<li><a href="javascript:ch(0, 2)">다음 <%=pagePerBlock%>개
				</a></li>
				<%
					}
				%>
			</ul>
		</div>
		<br />
		<br />
	</div>

	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>