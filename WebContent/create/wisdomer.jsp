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
							<h4>제목을 입력해주세요</h4>
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
							만남 내용</li>
					<li id="nav-section" class="">STEP2.
							시간,장소,가격</li>
					<li id="nav-wisdomer" class="">STEP3.
							사람책 정보</li>
					<li id="nav-request-review" class="">완료!</li>
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
								<label for="paymentGuide" style="width: 100%;"> 정산 정보 
								</label>
								<div class="row">
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px; ">
											<span class="input-group-addon">은행이름</span> <input
												type="text" name="settlementBankName" class="form-control"
												value="<%=settlementBankName %>" style="width:80%;"/>
										</div>
									</div>
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">계좌번호</span> <input
												type="text" name="settlementBankAccount"
												class="form-control" value="<%=settlementBankAccount %>" style="width:80%;"/>
										</div>
									</div>
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">예금주명</span> <input
												type="text" name="settlementName" class="form-control"
												value="<%=settlementName %>" style="width:80%;" />
										</div>
									</div>
									<div class="span6">
										<div class="input-group">
											<span class="input-group-addon">전화번호</span> <input
												type="text" value="<%=dto.getPhone() %>" class="form-control"
												disabled placeholder="" style="width:80%;"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>유료 만남을 진행하실 경우 입력해주세요.</li>
								<li>정산 정보가 정확하지 않을 경우 정산과 소득세 신고가 진행되지 않습니다. 입력 후 다시 한 번 확인
									부탁드려요!</li>
								<li>총 결제비용의 20%는 플랫폼 이용료로 책정되며, 이는 위즈돔 수수료(5%), PG사 결제 수수료,
									이메일/SMS 알림 서비스 및 부가세를 모두 포함합니다.</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="exampleInputEmail1">공개 프로필</label>
								<div class="row">
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">공개직업</span> <input
												type="text" name="job" value="<%=job %>" class="form-control" style="width:80%;"/>
										</div>
									</div>
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">자기소개</span>
											<textarea name="intro" class="form-control" rows="4" style="width:80%;"><%=intro %></textarea>
										</div>
									</div>
									<div class="span6">
										<div class="input-group" style="margin-bottom: 5px;">
											<span class="input-group-addon">메일주소</span> <input
												type="text" name="email" value="<%=dto.getEmail() %>" class="form-control"
												disabled style="width:80%;"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>해당 프로필 정보는 만남 내용 옆 사람책 정보로 노출됩니다. 프로필 내용이 잘 기재되어 있을수록
									만남에 대한 신뢰도가 높아지오니 충실히 작성해주세요.</li>
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
								<li>사전에 참가자들에게 확인하고 싶은 내용이 있다면, 물어보세요!</li>
								<li>해당 내용의 답변은 '개설하기>명단' 에서 확인하실 수 있습니다.</li>
							</ul>
						</div>
					</div>
					<div class="submit-group">
						<input type="submit" value="저장하고 다음" class="btn btn-primary btn-sm" id="btnSave" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<div style="height: 30px;"></div>
	</main>
	
	<%@ include file="../include/footer.jsp" %>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>