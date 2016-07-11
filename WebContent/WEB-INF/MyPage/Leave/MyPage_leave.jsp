<%--
페이지 - 마이페이지_회원탈퇴내역
작성자 - 이주연
수정날짜 - 2016/06/20
설명 -  로그인한 회원의 정보를 삭제한다.
 --%>

<%@ page contentType="text/html; charset=EUC-KR"%>
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
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(function() {
		$("#delLeave").click(function() {
			var check = $("input:checked");
			if (check.length == 3) {
				$("#f").submit();
			} else {
				alert("항목을 체크해주세요.");
			}
		});		
	});
	function fnMessage() {
		window.open("front?cmd=message_board", "",
				"width=500, height=500, scrollbars=yes");
	}
</script>
<style>
	#text{
		text-indent: 15px;
		color: block;
	}
</style>
<!-- Custom CSS -->
<link href="/KnowHowFactory/style.css" rel="stylesheet">
</head>
<body>
<%
int bmcount = 0;
%>

<jsp:useBean id="dao_b" class="dao.BookmarkDao" />
<%
	//즐겨찾기 개수		
		String mem_num = String.valueOf(session.getAttribute("loginMem_num"));	
		Vector<Bookmark_Dto> list_b = dao_b.BookmarkList(Integer.parseInt(mem_num));
		bmcount = list_b.size();

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
							즐겨찾기&nbsp;<a href="front?cmd=bookmark"><%=bmcount %></a>
						</h5>
					</div>
					<br/>
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
					<li><a href="front?cmd=payment">결제내역</a></li>
					<li class="divider"></li>
					<li><a href="front?cmd=update_check">정보수정</a></li>
					<li class="divider"></li>
					<li  class="active"><a href="front?cmd=leave">회원탈퇴</a></li>
					<li class="divider"></li>
				</ul>
			</div>
		</div>
	</div>

	<form action="front" method="post" id="f">
		<input type="hidden" name="cmd" value="delete_leave" />
		<div class="container" id="main1">
			<div class="span9">
				<ul class="nav nav-pills nav-stacked" id="menu">
					<li class="active"><a href="#" id="btn">회원탈퇴</a></li>
				</ul>
			</div>
			<div class="span9">
				<h4 id="text">노하우 Factory 아이디는 재사용 및 복구 불가 안내</h4>
				<br/>
				<div class="well well-large" >
					회원탈퇴 진행시 본인을 포함한 타인 모두 아이디 재사용이나 복구가 불가능합니다. <input type="checkbox"
						class="pull-right" />
				</div>
				<br />
				<h4 id="text">내정보 및 개인형 서비스 이용 기록 삭제</h4>
				<br/>
				<div class="well well-large">
					내 정보 및 개인형 서비스 이용기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <input
						type="checkbox" class="pull-right" />
				</div>
				<br />
				<h4 id="text">포인트에 대한 소멸 안내</h4>
				<br/>
				<div class="well well-large">				
					탈퇴시 보유한 포인트는 자동적으로 소멸되며, 재가입시 복원되지 않습니다. <input type="checkbox"
						class="pull-right" />
				</div>
				<br />
			</div>
		</div>
		<div class="modal hide fade inverse" id="leave">
			<div class="modal-body" style="text-align: center">
				<br />
				<p>
					<br />
				<h4>
					<strong>탈퇴 후에는 아이디와 데이터는 복구할 수 없습니다. </strong>
				</h4>
				<h4>
					<strong>그래도 탈퇴하시겠습니까?</strong>
				</h4>
				<br />
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" data-dismiss="modal">확인</button>
				<button class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>

		<div id="complete" align="center">
		<br/><br/>
			<p>
				<a href="#" data-toggle="modal" class="btn btn-primary"
					id="delLeave">확인</a>
				<a href="/KnowHowFactory/main.jsp" class="btn">취소</a>
			</p>
		</div>
	</form>
<br/><br/><br/>	
	<!-- footer -->
	<%@ include file="../../../include/footer.jsp"%>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>