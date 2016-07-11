<%--
페이지 - 마이페이지_결제내역
작성자 - 이주연
수정날짜 - 2016/06/27
설명 - 참가한 만남의 경우 결제내역에 출력
 --%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="dto.Payment_Dto"%>
<%@ page import="dto.Bookmark_Dto"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(function() {
		var price = $("#price");	
		$("#part_num").click(function() {
			if(price.val() > 0){
				fnRefund();
				return false;
			}else{ 	
				$("#f").submit();			
			}
		});
	});

	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
	function fnRefund() {
		window.open("front?cmd=refund", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<style>
	#result{
		color: #F1826F;
	}
</style>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">

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

		int mem_num =(Integer)session.getAttribute("loginMem_num");		
		
		Vector<Payment_Dto> list = dao.PaymentList(mem_num);
		totalRecord = list.size();
				
		//즐겨찾기 개수		
		Vector<Bookmark_Dto> list_b = dao_b.BookmarkList(mem_num);
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
				<img src="upload/${loginImage }" width="110" height="110">
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
					<li><a href="front?cmd=update_check">정보수정</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=leave">회원탈퇴</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<form action="front" method="post" id="f" style="margin-bottom: 250px">
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
							<th><strong>날짜</strong></th>
							<th><strong>결제항목</strong></th>
							<th><strong>결제방식</strong></th>
							<th><strong>금액</strong></th>
							<th><strong>상태</strong></th>						
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
							<td><%=dto.getReporting_date()%></td>
							<td><%=dto.getTitle()%></td>
							<td>
								<%
									String option = null;
										if(dto.getPayment_option() == -1){
											option = "";
										}else if (dto.getPrice() == 0) {
											option = "무료";
										}else if (dto.getPrice() > 0){
											option = "계좌이체";
										}
								%> <%=option%></td>
							<td style="text-align: right"><%=dto.getPrice()%>&nbsp;원
							<input type="hidden" id="price" value="<%=dto.getPrice() %>"/></td>
							<td id="result"><strong>
								<%
									String condition = null;
											if (dto.getPayment_option() == -1) {
												condition = "환불 처리";
											} else if (dto.getPrice() >= 0) {
												condition = "결제 승인";
											}
								%> <%=condition%></strong>
						<input type="hidden" id="option" name="option" value="<%=dto.getPayment_option()%>"/></td>
							<td>
							<%if(dto.getPayment_option() == -1){%>
								<button class="btn btn-warning"
									value="<%=dto.getPart_num()%>" disabled="disabled">요청</button>
							<%
							}else if(dto.getPrice() == 0){%>
							<button class="btn btn-warning" id="part_num" name="part_num" value="<%=dto.getPart_num()%>">요청</button>
							<%}else{%>
								<%--<button class="btn btn-warning" name="part_num" id="part_num"
										value="<%=dto.getPart_num()%>" >요청</button> --%>
								<a href="front?cmd=refund&part_num=<%=dto.getPart_num() %>" class="btn btn-warning" 
								  id="part_num" name="part_num" value="<%=dto.getPart_num()%>">요청</a>
							<%
							}
							%>		
							</td>
						</tr>
					</tbody>
					<%
						}
						}
					%>

				</table>
				<br />
				<div class="pagination"
					style="text-align: center; margin-top: 350px">
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
		</div>
	</form>
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
