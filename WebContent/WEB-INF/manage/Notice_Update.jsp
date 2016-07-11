<!-- 
페이지 : 공지사항 수정(일반회원 접근불가)
작성자 : 전현영
설명 : 공지사항 수정은 관리자만이 수행 가능하다 
 -->

<%@page import="dao.NoticeDao"%>
<%@page import="dto.NoticeDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="bootstrap/css/bootstrap-responsive.min.css">
	<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	//값을 입력하고 전송을 한건지 확인
	function ck_submit(){
		if(!document.board.title.value){
			alert("제목을 입력해주세요");
			return;
		}
		if(!document.board.content.value){
			alert("내용을 입력해주세요");
			return;
		}
		
		document.board.submit();
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		NoticeDto dto = new NoticeDto();
		NoticeDao dao = new NoticeDao();

		int notice_num = Integer.parseInt(request.getParameter("notice_num"));

		dto = dao.getNotice(notice_num);		//전송받은 값(기본키인 notice_num)으로 저장되어 있던값을 불러온다
	%>
	<%@ include file="../../include/header.jsp" %>

	<br />
	<br />

	<div class="row">
		<%@ include file="../../inline.jsp" %>

		<div class="span8">
			<form method="post" action="manage" name="board" id="board">
				<input type="hidden" name="notice_num" value="<%=notice_num %>">
				<input type="hidden" name="cmd" value="notice_update"/>
				<table style="width:90%;height:90%">
					<thead>
						<tr>
							<td
								style="background-color: silver; color: black; font-weight: bold;">노하우
								팩토리 공지사항</td>
						</tr>
					</thead>
					<tbody style="padding-top:200px">
						<tr>
							<td style="width=100%;margin-left:-5%;"><input type="text" name="title" style="width:80%;" placeholder="게  시  글  제  목" value="<%=dto.getTitle()%>"/></td>
						</tr>
						<tr>
							<td style="height:400px"><textarea style="width:95%;height:95%;margin-top:-1%" placeholder="게  시  글  내  용" name="content"><%=dto.getContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
			</form>
			<input class="btn" type="button" value="등록" onclick="ck_submit()" style="margin-left:40%;"/>&nbsp;&nbsp;<input type="button" class="btn" value="취소"/>
		</div>
	</div>
	<%@ include file="../../include/footer.jsp"%>
	<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>