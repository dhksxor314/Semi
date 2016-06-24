<!-- ȸ�������� ������ -->
<%@page import="java.util.Vector"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
#title {
	font-size: 30px;
}
#inputZip1, #inputZip2{
	width:40px;
}

.pull-right {
	margin-right: 50px;
}

</style>
<script>
var idReg = /^[A-za-z0-9]{7,12}$/;//7~12�ڸ����� �����ڿ� ���ڸ� ���
var number = /^[0-9]*$/;//���ڸ� ����
var pwReg = /^[a-zA-Z0-9]{7,15}$/;//���ڿ� �����ڸ����� 7~15�ڸ�
var img = /(\.gif|\.png|\.jpg|\.jpeg)$/i;//�̹��� ���� ���ĸ� ����

//�Էµ� ���鿡 ������ ������ Ȯ��
function check(){
	alert($("input[type=file]").val());
	if(!idReg.test($("#inputId").val())){
		alert("���̵� �ùٸ��� �ʽ��ϴ�.");
		return false;
	}
	if(!pwReg.test($("#inputPassword").val())){
		alert("��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
		return false;
	}
	if($("#inputPassword").val()!=$("#inputPasswordConfirm").val()){
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		return false;
	}
	if($("input[name=email1]").val()<5 || !$("input[name=email2]").val()){
		alert("�̸����� �ùٸ��� �Էµ��� �ʾҽ��ϴ�.");
		return false;
	}
	if($("input[type=file]").val()!=""){
		if(!img.test($("input[type=file]").val())){
			alert("�̹��� ������ �ƴմϴ�");
			return false;
		}
	}
	if(document.f.duplicate.value!=1){
		alert("���̵� �ߺ�Ȯ���� �ϼ���");
		return false;
	}
}

//�ߺ��� ���̵� �ִ��� Ȯ��
function check_duplicate(){
	if(!document.f.id.value){
		alert("���̵� �Է��ϼ���");
		return;
	}
	url = "check_duplicate.jsp?id="+document.f.id.value;
	
	window.open(url, "", "width=200, height=100, left=1300, top=200, location=no");
}
//�̸��� �ּҸ� �����Է����� �ʰ� �����ؼ� �Է��� ��
$(document).ready(function(){
	
	
	$("#opt").change(function(){
		if($("#opt").val()!="�����Է�")
			$("#inputEmail2").val($("#opt").val());
	});
	//�ߺ�Ȯ�� ���Ŀ� ���̵� ���� ������ ��� �ߺ�Ȯ���� �ٽ��ϵ�����
	$("#inputId").change(function(){
		$("#duplicate").val(-1);
	});
	//���̵� ��ȿ�� �˻�
	$("#inputId").keyup(function(){
		if($("#inputId").val().length==0){
			$("#id").text("�Էµ� ���̵� �����ϴ�");
			$("#id").css("color", "red");
			return;
		}
		if($("#inputId").val().length>0){
			if(idReg.test($("#inputId").val())){
				$("#id").text("�ùٸ� ���̵� �Դϴ�.");
				$("#id").css("color", "green");
			}
			else if(!idReg.test($("#inputId").val())){
				$("#id").text("�ùٸ��� ���� ���̵�");
				$("#id").css("color", "orange");
			}
		}
	});
	//��й�ȣ ��ȿ�� �˻�
	$("#inputPassword").keyup(function(){
		
		if($("#inputPassword").val().length==0){
			$("#pw1").text("�Էµ� ��й�ȣ�� �����ϴ�");
			$("#pw1").css("color", "red");
			return;
		}
		if($("#inputPassword").val().length>0){
			if(pwReg.test($("#inputPassword").val())){
				$("#pw1").text("�ùٸ� ��й�ȣ �Դϴ�.");
				$("#pw1").css("color", "green");
			}
			else if(!pwReg.test($("#inputPassword").val())){
				$("#pw1").text("�ùٸ��� ���� ��й�ȣ");
				$("#pw1").css("color", "orange");
				
			}
		}
	});
	//��й�ȣ�� ������ Ȯ��
	$("input[id^=inputPassword]").keyup(function(){
		
		if($("#inputPasswordConfirm").val().length==0){
			$("#pw2").text("�Էµ� ��й�ȣ�� �����ϴ�");
			$("#pw2").css("color", "red");
			return;
		}
		if($("#inputPasswordConfirm").val().length>0){
			if($("#inputPassword").val()!=$("#inputPasswordConfirm").val()){
				$("#pw2").text("�Էµ� ��й�ȣ�� ���� �ٸ��ϴ�");
				$("#pw2").css("color", "orange");
			}
			else if($("#inputPassword").val()==$("#inputPasswordConfirm").val()){
				$("#pw2").text("�Էµ� ��й�ȣ�� �����ϴ�");
				$("#pw2").css("color", "green");
			}
		}
	});
	
	$("input[type=tel]").keyup(function(){
		if(!number.test($("input[name=tel1]").val())){
			$("#p").text("���ڸ� �Է��ؾ� �մϴ�");
			$("#p").css("color", "orange");
			return;
		}
		if(!number.test($("input[name=tel2]").val())){
			$("#p").text("���ڸ� �Է��ؾ� �մϴ�");
			$("#p").css("color", "orange");
			return;
		}

		if($("input[name=tel1]").val().length<3){
			$("#p").text("�Էµ� ���ڰ� �����ϴ�");
			$("#p").css("color", "orange");
			return;
		}
		if($("input[name=tel2]").val().length<4){
			$("#p").text("�Էµ� ���ڰ� �����ϴ�");
			$("#p").css("color", "orange");
			return;
		}
		if($("input[name=tel1]").val().length>=3 && $("input[name=tel2]").val().length==4){
			$("#p").text("�ùٸ� ���� ��ȭ��ȣ");
			$("#p").css("color", "green");
		}
	});
});
</script>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<!-- 
	<div>
		<ul class="nav nav-pills">
			<li><a href="#"><img src="../images/logo.PNG"></a></li>
			<li><a href="#" class="btn btn-info btn-large">�����ϱ�</a></li>
			<li class="dropdown"><a class="dropdown-toggle btn-large"
				data-toggle="dropdown" href="#">�����ϱ�<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">����</a></li>
					<li><a href="#">����</a></li>
				</ul></li>
		</ul>
	</div>
	 -->
	<div class="container">
		<div class="row">
			<div class="span3"></div>
			<div class="span8" id="loginDiv">
				<span id="title">ȸ������</span>
				<hr />
				
				<form class="form-horizontal" method="post" action="manage" name="f" enctype="multipart/form-data" onSubmit="return check();">
					<input type="hidden" name="cmd" value="sign"/>
					<input type="hidden" id="duplicate" name="duplicate" value=""/>
					<div class="control-group">
						<label class="control-label" for="inputId">���̵�</label>
						<div class="controls">
							<input type="text" id="inputId" placeholder="5~12�ڸ� ������ ����" name="id" value="">
							<input type="button" class="btn" value="�ߺ�Ȯ��" onclick="check_duplicate()"/>

						</div>
					</div>
					<p id="id" style="margin-left:30%;margin-top:-20px; color: red">���̵� �Էµ��� �ʾҽ��ϴ�</p>
					<div class="control-group">
						<label class="control-label" for="inputPassword">��й�ȣ</label>
						<div class="controls">
							<input type="password" id="inputPassword" placeholder="��й�ȣ" name="pass">
						</div>
					</div>
					<p id="pw1" style="margin-left:30%;margin-top:-20px;color: red">&nbsp;</p>
					<div class="control-group">
						<label class="control-label" for="inputPasswordConfirm">��й�ȣ Ȯ��</label>
						<div class="controls">
							<input type="password" id="inputPasswordConfirm" placeholder="��й�ȣ Ȯ��" name="confirm">
						</div>
					</div>
					<p id="pw2" style="margin-left:30%;margin-top:-20px;color: red">&nbsp;</p>
					<div class="control-group">
						<label class="control-label" for="inputName">�̸�</label>
						<div class="controls">
							<input type="text" id="inputName" placeholder="2~5���� �Է��� �ʿ��մϴ�" name="name">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�޴�����ȣ</label>
						<div class="controls">
							<select style="width:80px" name="tel0">	
								<option>010</option>
								<option>016</option>
							</select>
							- <input style="width:50px" type="tel" name="tel1" maxlength="4"/> - <input style="width:50px" type="tel" name="tel2" maxlength="4"/>
						</div>
					</div>
					<p id="p" style="margin-left:30%;margin-top:-20px;">&nbsp;</p>					
					<div class="control-group">
						<label class="control-label" for="inputName">�������</label>
						<div class="controls">
							<select style="width:100px" name="birth" >
							<% 
								//���� �⵵���� 1950������� option�� ����
								Calendar cal = Calendar.getInstance();
								int year = cal.get(Calendar.YEAR);
								
								for(int i=year;i>=1950;i--){
							%>
								<option><%= i+"��" %></option>
							<%	} %>
							</select>
							
							<select style="width:70px" name="month">
								<% for(int i=1;i<=12;i++){ %>
									<option><%= i+"��" %></option>
								<%	} %>
							</select>
							
							<select style="width:70px" name="day">
								<% for(int i=1;i<=31;i++){ %>
									<option><%= i+"��" %></option>
								<%	} %>
							</select>
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputGender">����</label>
						<div class="controls">
							<input type="radio" id="inputGender" name="gender" value="��" checked="checked">��
							<input type="radio" id="inputGender" name="gender" value="��">��
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">E-Mail</label>
						<div class="controls">
							<input type="text" id="inputEmail1" name="email1" style="width:80px">&nbsp;@
							<input type="text" id="inputEmail2" name="email2" style="width:80px">
							<select style="width:100px" id="opt">
								<option>�����Է�</option>
								<option value="naver.com">naver</option>
								<option value="daum.net">daum</option>
								<option value="gmail.com">gmail</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputImage">������ ����</label>
						<div class="controls">
							<input type="file" name="image" id="inputImage">
						</div>
					</div>
					<p id="i" style="margin-left:30%;margin-top:-20px;">�̹��� ���ϸ� �÷����մϴ�</p>
					<div id="checkbox" style="margin-left:100px;">
						<label class="checkbox"> <input type="checkbox" required="required"> Ȩ������ �̿��� ����
						</label> <label class="checkbox"> <input type="checkbox" required="required"> �������� �̿��� ����
						</label> <label class="checkbox"> <input type="checkbox" name="invite_agree" value="Y"> �ʴ� ���� ���� ����
						</label>
					</div>

					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn">�����ϱ�</button>&nbsp;&nbsp;<button type="reset" class="btn" onclick="history.back()">���</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp" %>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

