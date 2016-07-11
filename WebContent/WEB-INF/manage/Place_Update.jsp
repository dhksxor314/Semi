<!-- 
������ : ��ҵ�� ������
�ۼ��� : ������
���� : �����ڰ� ��Ҹ� ������ �� ��� �ϴ� ������
 		
 -->

<%@page import="dao.PlaceDao"%>
<%@page import="dto.PlaceDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
</head>
<style>

#title {
	text-align: left;
	margin-bottom: -90px;
	font-size: 30px;
	font-family: fantasy;
}

.container{
	margin-top:100px;
}

</style>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String place_num = request.getParameter("place_num");
	
	
	PlaceDao dao = new PlaceDao();
	
	PlaceDto dto = dao.getPlace(Integer.parseInt(place_num));
%>
	<%@ include file="common.jsp" %>

	<div class="container">
		<div class="row">
			<div id="insert">
				<div class="span3"></div>
				<div class="span6">
					<span id="title">��� ����</span>
					<hr />
					<form class="form-horizontal" method="post" action="manage" name="f">
						<input type="hidden" name="cmd" value="place_update"/>
						<input type="hidden" name="place_num" value="<%= dto.getPlace_num() %>"/>
						<div class="control-group">
							<label class="control-label" for="inputName">�̸�</label>
							<div class="controls">
								<input type="text" id="inputName" name="name" placeholder="�̸�" value="<%=dto.getPlace_name()%>">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputAddr">�ּ�</label>
							<div class="controls">
								<input type="text" name="addr" id="inputAddr" placeholder="�ּ�" value="<%=dto.getAddress()%>">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputCapacity">�����ο�</label>
							<div class="controls">
								<input type="number" name="capacity" id="inputCapacity" placeholder="�����ο�" value="<%=dto.getCapacity()%>">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputTel">��ȭ��ȣ</label>
							<div class="controls">
								<input type="tel" name="tel" id="inputTel" placeholder="��ȭ��ȣ" value="<%=dto.getPhone()%>">
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">����</button>
								<button type="reset" class="btn" onclick="manage?cmd=Place_List">���</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>