<%@page import="create.createDto"%>
<%@page import="create.createDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<style>
.menu-header {
	width: 100%;
	padding: 20px 0px;
	background-color: #ebebeb;
	border-bottom: 1px solid #ddd;
}

.menu-header h4 {
	padding-top: 14px;
}
</style>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	
	
	Object taxType=null, settlementBankName=null,settlementBankAccount=null, settlementName=null,
			job=null, intro=null, message=null, phone=null;
	if(session.getAttribute("taxType") != null){
		taxType=session.getAttribute("taxType");
	}else{
		taxType="";
	}if(session.getAttribute("settlementBankName") != null){
		settlementBankName=session.getAttribute("settlementBankName");
	}else{
		settlementBankName="";
	}if(session.getAttribute("settlementBankAccount") != null){
		settlementBankAccount=session.getAttribute("settlementBankAccount");
	}else{
		settlementBankAccount="";
	}if(session.getAttribute("settlementName") != null){
		settlementName=session.getAttribute("settlementName");
	}else{
		settlementName="";
	}if(session.getAttribute("job") != null){
		job=session.getAttribute("job");
	}else{
		job="";
	}if(session.getAttribute("intro") != null){
		intro=session.getAttribute("intro");
	}else{
		intro="";
	}if(session.getAttribute("message") != null){
		message=session.getAttribute("message");
	}else{
		message="";
	}if(session.getAttribute("phone") != null){
		phone=session.getAttribute("phone");
	}else{
		phone="";
	}
	int loginMem_num = Integer.parseInt(String.valueOf(session.getAttribute("loginMem_num")));
	createDao dao=new createDao();
	createDto dto=new createDto();
	dto=dao.getphone(loginMem_num);
	
%>
	<%@ include file="../include/header.jsp" %>


	<div class="hidden-sm hidden-xs" style="padding-bottom: 60px;">
		<div class="menu-header">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="pull-left">
							<h4>������ �Է����ּ���</h4>
						</div>
						<div class="pull-right"></div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="span12">
				<ul class="nav nav-pills nav-justified make-step">
					<li id="nav-basic-info" class="">STEP1.
							���� ����</li>
					<li id="nav-section" class="">STEP2.
							�ð�,���,����</li>
					<li id="nav-wisdomer" class="">STEP3.
							���å ����</li>
					<li id="nav-request-review" class="">�Ϸ�!</li>
				</ul>
			</div>
		</div>

		<div class="row wisdomer">
			<div class="span12">
				<form class="form" id="formWisdomer" method="post" action="control">
					<input type="hidden" name="cmd" id="cmd" value="requestreview" />
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="paymentGuide" style="width: 100%;"> ���� ���� 
								</label>
								<div class="row">
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px; ">
											<span class="input-group-addon">�����̸�</span> <input
												type="text" name="settlementBankName" class="form-control"
												value="<%=settlementBankName %>" style="width:80%;"/>
										</div>
									</div>
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">���¹�ȣ</span> <input
												type="text" name="settlementBankAccount"
												class="form-control" value="<%=settlementBankAccount %>" style="width:80%;"/>
										</div>
									</div>
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">�����ָ�</span> <input
												type="text" name="settlementName" class="form-control"
												value="<%=settlementName %>" style="width:80%;" />
										</div>
									</div>
									<div class="span6">
										<div class="input-group">
											<span class="input-group-addon">��ȭ��ȣ</span> <input
												type="text" value="<%=dto.getPhone() %>" class="form-control"
												disabled placeholder="" style="width:80%;"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>���� ������ �����Ͻ� ��� �Է����ּ���.</li>
								<li>���� ������ ��Ȯ���� ���� ��� ����� �ҵ漼 �Ű� ������� �ʽ��ϴ�. �Է� �� �ٽ� �� �� Ȯ��
									��Ź�����!</li>
								<li>�� ��������� 20%�� �÷��� �̿��� å���Ǹ�, �̴� ��� ������(5%), PG�� ���� ������,
									�̸���/SMS �˸� ���� �� �ΰ����� ��� �����մϴ�.</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="exampleInputEmail1">���� ������</label>
								<div class="row">
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">��������</span> <input
												type="text" name="job" value="<%=job %>" class="form-control" style="width:80%;"/>
										</div>
									</div>
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">�ڱ�Ұ�</span>
											<textarea name="intro" class="form-control" rows="4" style="width:80%;"><%=intro %></textarea>
										</div>
									</div>
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">�����ּ�</span> <input
												type="text" name="email" value="<%=dto.getEmail() %>" class="form-control"
												disabled style="width:80%;"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>�ش� ������ ������ ���� ���� �� ���å ������ ����˴ϴ�. ������ ������ �� ����Ǿ� ��������
									������ ���� �ŷڵ��� ���������� ����� �ۼ����ּ���.</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<input type="hidden" name="message" id="message" class="form-control solo"
									rows="4" style="width:80%;"/>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>������ �����ڵ鿡�� Ȯ���ϰ� ���� ������ �ִٸ�, �������!</li>
								<li>�ش� ������ �亯�� '�����ϱ�>���' ���� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
							</ul>
						</div>
					</div>
					<div class="submit-group">
						<input type="submit" value="�����ϰ� ����" class="btn btn-primary btn-sm" id="btnSave" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<div style="height: 30px;"></div>
	</main>
	
	<%@ include file="../include/footer.jsp" %>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery�� �׻� ���� �־�� �� (���� �߿�) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>