<!-- 
������ : �������� ���
�ۼ��� : ������
���� : �������� ����� �����ڸ��� ������ �� �ִ� �۾��̴�.
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
	//���� �Է��� ����� �ϴ°��� Ȯ��
	function ck_submit(){
		if(!document.board.title.value){
			alert("������ �Է����ּ���");
			return;
		}
		if(!document.board.content.value){
			alert("������ �Է����ּ���");
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
								style="background-color: silver; color: black; font-weight: bold;">���Ͽ�
								���丮 ��������</td>
						</tr>
					</thead>
					<tbody style="padding-top:200px">
						<tr>
							<td style="width=100%;margin-left:-5%;"><input type="text" name="title" id="title" style="width:80%;" placeholder="��  ��  ��  ��  ��"/></td>
						</tr>
						<tr>
							<td style="height:400px"><textarea style="width:95%;height:95%;margin-top:-1%" placeholder="��  ��  ��  ��  ��" name="content" id="content"></textarea></td>
						</tr>
					</tbody>
				</table>
			<input class="btn" type="button" value="���" onclick="ck_submit()" style="margin-left:35%;"/>&nbsp;&nbsp;<input type="reset" class="btn" value="���"/>
			</form>	
		</div>
	</div>
	<%@ include file="../../include/footer.jsp"%>
	<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>