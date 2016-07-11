<!-- 
페이지 : 공지사항 등록
작성자 : 전현영
설명 : 공지사항 등록은 관리자만이 수행할 수 있는 작업이다.
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
	//값을 입력후 등록을 하는건지 확인
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
	
%>
	<%@ include file="../../include/header.jsp" %>

	<br />
	<br />

	<div class="row">
		<%@ include file="../../inline.jsp" %>

		<div class="span8">
			<form method="post" action="manage" name="board">
				<input type="hidden" name="cmd" value="notice_insert"/>
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
							<td style="width=100%;margin-left:-5%;"><input type="text" name="title" id="title" style="width:80%;" placeholder="게  시  글  제  목"/></td>
						</tr>
						<tr>
							<td style="height:400px"><textarea style="width:95%;height:95%;margin-top:-1%" placeholder="게  시  글  내  용" name="content" id="content"></textarea></td>
						</tr>
					</tbody>
				</table>
			<input class="btn" type="button" value="등록" onclick="ck_submit()" style="margin-left:35%;"/>&nbsp;&nbsp;<input type="reset" class="btn" value="취소"/>
			</form>	
		</div>
	</div>
	<%@ include file="../../include/footer.jsp"%>
	<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>