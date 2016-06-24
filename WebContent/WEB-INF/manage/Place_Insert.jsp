<!-- 
������ : ��ҵ�� ������
�ۼ��� : ������
���� : �����ڰ� ��Ҹ� ����� �� ��� �ϴ� ������
 		
 -->

<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
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
	<%@ include file="common.jsp" %>

	<div class="container">
		<div class="row">
			<div id="insert">
				<div class="span3"></div>
				<div class="span6">
					<span id="title">��� ���</span>
					<hr />
					<form class="form-horizontal" method="post" action="manage" name="f">
						<input type="hidden" name="cmd" value="place_insert"/>
						<div class="control-group">
							<label class="control-label" for="inputName">�̸�</label>
							<div class="controls">
								<input type="text" id="inputName" name="name" placeholder="�̸�">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputAddr">�ּ�</label>
							<div class="controls">
								<input type="text" name="addr" id="inputAddr" placeholder="�ּ�">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputCapacity">�����ο�</label>
							<div class="controls">
								<input type="number" name="capacity" id="inputCapacity" placeholder="�����ο�">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputTel">��ȭ��ȣ</label>
							<div class="controls">
								<input type="tel" name="tel" id="inputTel" placeholder="��ȭ��ȣ">
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">���</button>
								<button type="reset" class="btn" onclick="manage?cmd=Place_List">���</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>