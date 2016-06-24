<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="dto.Payment_Dto"%>
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
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(function() {

		var option = $("#option");
		option.click(function() {
			for (var i = 0; option.length; i++) {
				if (option[i].val() == -1) {
					alert("이미 환불처리가 완료되었습니다.");
					return false;
				} else {
					return true;
				}
			}
		});

		$("#delBtn").click(function() {
			$("#f").submit();
		});
	});

	function fnMessage() {
		window.open("front?action=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<!-- Custom CSS -->
<link href="../../../style.css" rel="stylesheet">
<style>
p {
	font-size: 16px;
	text-align: left;
	text-indent: 10px;
}
</style>
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
	<jsp:useBean id="dao" class="dao.PaymentDao" />

	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		Vector<Payment_Dto> list = dao.PaymentList();
		totalRecord = list.size();

		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));	
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
							즐겨찾기&nbsp;<a href="front?action=bookmark"><%=bmcount%></a>
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
					<li><a href="front?cmd=point">포인트내역</a></li>
					<li class="divider"></li>
					<li class="active"><a href="front?cmd=payment">결제내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=update">정보수정</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">회원탈퇴</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_payment" />


		<div class="container" id="main1">
			<div class="span9">
				<ul class="nav nav-pills nav-stacked" id="menu">
					<li class="active"><a href="#" id="btn">결제내역</a></li>
				</ul>
			</div>

			<div class="span9" id="table">
				<table class="div-table table bsk-tbl bg-white">
					<thead>
						<tr class="bg-black">
							<th><strong>결제항목</strong></th>
							<th><strong>금액</strong></th>
							<th><strong>결제방식</strong></th>
							<th><strong>상태</strong></th>
							<th><strong>날짜</strong></th>
							<th><strong>취소/환불</strong></th>
						</tr>
					</thead>
					<tbody>
						<%
							if (list.size() == 0) {
						%>
						<tr>
							<td colspan="9" style="text-align: center"><h5>
									<br />결제한 내역이 없습니다.
								</h5></td>
						</tr>
						<%
							} else {
								for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
									if (i == totalRecord)
										break;
									Payment_Dto dto = list.get(i);
						%>
						<tr>
							<td><%=dto.getTitle()%></td>
							<td><%=dto.getPrice()%></td>
							<td>
								<%
									String option = null;
									out.print(dto.getPayment_option());
											if (dto.getPayment_option() == 1) {
												option = "무통장입금";
											}else {
												option = "";
											}
								%> <%=option%></td>
							<td id="opt">
								<%
									String condition = null;
											if (dto.getPayment_option() == -1) {
												condition = "환불 처리";
											} else if (dto.getPrice() >= 0) {
												condition = "결제 승인";
											}
								%> <%=condition%></td>
							<td><%=dto.getReporting_date()%></td>
							<td>
								<button class="btn btn-warning" data-target="#cencle<%=i%>"
									data-toggle="modal" name="part_num<%=i%>" id="part_num<%=i%>" value="<%=dto.getPart_num()%>">요청</button>
									
								<div class="modal hide fade" id="cencle<%=i%>">
									<div class="modal-header">
										<a href="#" class="close" data-dismiss="modal">&times;</a>
										<h4>
											<strong>
<%=dto.getTitle()%> 
를 취소 및 환불하시겠습니까?
											</strong>
										</h4>
									</div>
									<div class="modal-body">
										<p style="font-size: 16px">
										<p style="text-align: left">1. 취소 및 환불한 강연 및 모임에 대해서 재신청이
											가능합니다.</p>
										<p style="text-align: left">
											2. 환불처리는 <font class="cencel"><strong>1일</strong></font> 이후에
											이루어집니다.
										</p>
									</div>
									<div class="modal-footer">
										<button class="btn btn-primary" data-dismiss="modal"
											id="delBtn">확인</button>
										<input type="hidden" name="option"
											value="<%=dto.getPayment_option()%>">
										<button class="btn" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
					<%
						}
						}
					%>

				</table>
					<br/>					
					<div class="pagination" style="text-align: center">
							<ul>
								<% if(nowBlock > 0){ %>
									<li><a href="javascript:ch(0, 0)">이전 <%=pagePerBlock%>개</a></li>
					
								<% } %>
								
								<%
									for(int i=0; i<pagePerBlock; i++){
										if((nowBlock*pagePerBlock)+i == totalPage){
											break;
										}
								%>
									
									<li><a href="javascript:ch(<%=i%>, 1)">
										<%=i+1+(nowBlock*pagePerBlock)%></a></li>
								<% 
									}
								%>
								<% if(totalBlock > nowBlock+1){ %>
									<li><a href="javascript:ch(0, 2)">다음 <%=pagePerBlock%>개</a></li>
								<%} %>
							</ul>
						</div><br/><br/>		
				</div>	
			</div>		
	</form>
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
