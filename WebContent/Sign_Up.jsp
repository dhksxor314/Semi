<!-- 회원가입폼 페이지 -->
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
var idReg = /^[A-za-z0-9]{7,12}$/;//7~12자리까지 영문자와 숫자만 허용
var number = /^[0-9]*$/;//숫자만 가능
var pwReg = /^[a-zA-Z0-9]{7,15}$/;//숫자와 영문자만으로 7~15자리
var img = /(\.gif|\.png|\.jpg|\.jpeg)$/i;//이미지 파일 형식만 가능

//입력된 값들에 문제가 없는지 확인
function check(){
	alert($("input[type=file]").val());
	if(!idReg.test($("#inputId").val())){
		alert("아이디가 올바르지 않습니다.");
		return false;
	}
	if(!pwReg.test($("#inputPassword").val())){
		alert("비밀번호가 올바르지 않습니다.");
		return false;
	}
	if($("#inputPassword").val()!=$("#inputPasswordConfirm").val()){
		alert("비밀번호가 같지 않습니다.");
		return false;
	}
	if($("input[name=email1]").val()<5 || !$("input[name=email2]").val()){
		alert("이메일이 올바르게 입력되지 않았습니다.");
		return false;
	}
	if($("input[type=file]").val()!=""){
		if(!img.test($("input[type=file]").val())){
			alert("이미지 형식이 아닙니다");
			return false;
		}
	}
	if(document.f.duplicate.value!=1){
		alert("아이디 중복확인을 하세요");
		return false;
	}
}

//중복된 아이디가 있는지 확인
function check_duplicate(){
	if(!document.f.id.value){
		alert("아이디를 입력하세요");
		return;
	}
	url = "check_duplicate.jsp?id="+document.f.id.value;
	
	window.open(url, "", "width=200, height=100, left=1300, top=200, location=no");
}
//이메일 주소를 직접입력하지 않고 선택해서 입력할 때
$(document).ready(function(){
	
	
	$("#opt").change(function(){
		if($("#opt").val()!="직접입력")
			$("#inputEmail2").val($("#opt").val());
	});
	//중복확인 이후에 아이디 값이 변했을 경우 중복확인을 다시하도록함
	$("#inputId").change(function(){
		$("#duplicate").val(-1);
	});
	//아이디 유효성 검사
	$("#inputId").keyup(function(){
		if($("#inputId").val().length==0){
			$("#id").text("입력된 아이디가 없습니다");
			$("#id").css("color", "red");
			return;
		}
		if($("#inputId").val().length>0){
			if(idReg.test($("#inputId").val())){
				$("#id").text("올바른 아이디 입니다.");
				$("#id").css("color", "green");
			}
			else if(!idReg.test($("#inputId").val())){
				$("#id").text("올바르지 않은 아이디");
				$("#id").css("color", "orange");
			}
		}
	});
	//비밀번호 유효성 검사
	$("#inputPassword").keyup(function(){
		
		if($("#inputPassword").val().length==0){
			$("#pw1").text("입력된 비밀번호가 없습니다");
			$("#pw1").css("color", "red");
			return;
		}
		if($("#inputPassword").val().length>0){
			if(pwReg.test($("#inputPassword").val())){
				$("#pw1").text("올바른 비밀번호 입니다.");
				$("#pw1").css("color", "green");
			}
			else if(!pwReg.test($("#inputPassword").val())){
				$("#pw1").text("올바르지 않은 비밀번호");
				$("#pw1").css("color", "orange");
				
			}
		}
	});
	//비밀번호가 같은지 확인
	$("input[id^=inputPassword]").keyup(function(){
		
		if($("#inputPasswordConfirm").val().length==0){
			$("#pw2").text("입력된 비밀번호가 없습니다");
			$("#pw2").css("color", "red");
			return;
		}
		if($("#inputPasswordConfirm").val().length>0){
			if($("#inputPassword").val()!=$("#inputPasswordConfirm").val()){
				$("#pw2").text("입력된 비밀번호가 서로 다릅니다");
				$("#pw2").css("color", "orange");
			}
			else if($("#inputPassword").val()==$("#inputPasswordConfirm").val()){
				$("#pw2").text("입력된 비밀번호가 같습니다");
				$("#pw2").css("color", "green");
			}
		}
	});
	
	$("input[type=tel]").keyup(function(){
		if(!number.test($("input[name=tel1]").val())){
			$("#p").text("숫자만 입력해야 합니다");
			$("#p").css("color", "orange");
			return;
		}
		if(!number.test($("input[name=tel2]").val())){
			$("#p").text("숫자만 입력해야 합니다");
			$("#p").css("color", "orange");
			return;
		}

		if($("input[name=tel1]").val().length<3){
			$("#p").text("입력된 숫자가 적습니다");
			$("#p").css("color", "orange");
			return;
		}
		if($("input[name=tel2]").val().length<4){
			$("#p").text("입력된 숫자가 적습니다");
			$("#p").css("color", "orange");
			return;
		}
		if($("input[name=tel1]").val().length>=3 && $("input[name=tel2]").val().length==4){
			$("#p").text("올바른 형식 전화번호");
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
			<li><a href="#" class="btn btn-info btn-large">개설하기</a></li>
			<li class="dropdown"><a class="dropdown-toggle btn-large"
				data-toggle="dropdown" href="#">참가하기<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">강연</a></li>
					<li><a href="#">모임</a></li>
				</ul></li>
		</ul>
	</div>
	 -->
	<div class="container">
		<div class="row">
			<div class="span3"></div>
			<div class="span8" id="loginDiv">
				<span id="title">회원가입</span>
				<hr />
				
				<form class="form-horizontal" method="post" action="manage" name="f" enctype="multipart/form-data" onSubmit="return check();">
					<input type="hidden" name="cmd" value="sign"/>
					<input type="hidden" id="duplicate" name="duplicate" value=""/>
					<div class="control-group">
						<label class="control-label" for="inputId">아이디</label>
						<div class="controls">
							<input type="text" id="inputId" placeholder="5~12자리 영문과 숫자" name="id" value="">
							<input type="button" class="btn" value="중복확인" onclick="check_duplicate()"/>

						</div>
					</div>
					<p id="id" style="margin-left:30%;margin-top:-20px; color: red">아이디가 입력되지 않았습니다</p>
					<div class="control-group">
						<label class="control-label" for="inputPassword">비밀번호</label>
						<div class="controls">
							<input type="password" id="inputPassword" placeholder="비밀번호" name="pass">
						</div>
					</div>
					<p id="pw1" style="margin-left:30%;margin-top:-20px;color: red">&nbsp;</p>
					<div class="control-group">
						<label class="control-label" for="inputPasswordConfirm">비밀번호 확인</label>
						<div class="controls">
							<input type="password" id="inputPasswordConfirm" placeholder="비밀번호 확인" name="confirm">
						</div>
					</div>
					<p id="pw2" style="margin-left:30%;margin-top:-20px;color: red">&nbsp;</p>
					<div class="control-group">
						<label class="control-label" for="inputName">이름</label>
						<div class="controls">
							<input type="text" id="inputName" placeholder="2~5글자 입력이 필요합니다" name="name">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">휴대폰번호</label>
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
						<label class="control-label" for="inputName">생년월일</label>
						<div class="controls">
							<select style="width:100px" name="birth" >
							<% 
								//현재 년도부터 1950년까지의 option을 생성
								Calendar cal = Calendar.getInstance();
								int year = cal.get(Calendar.YEAR);
								
								for(int i=year;i>=1950;i--){
							%>
								<option><%= i+"년" %></option>
							<%	} %>
							</select>
							
							<select style="width:70px" name="month">
								<% for(int i=1;i<=12;i++){ %>
									<option><%= i+"월" %></option>
								<%	} %>
							</select>
							
							<select style="width:70px" name="day">
								<% for(int i=1;i<=31;i++){ %>
									<option><%= i+"일" %></option>
								<%	} %>
							</select>
							
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputGender">성별</label>
						<div class="controls">
							<input type="radio" id="inputGender" name="gender" value="남" checked="checked">남
							<input type="radio" id="inputGender" name="gender" value="여">여
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">E-Mail</label>
						<div class="controls">
							<input type="text" id="inputEmail1" name="email1" style="width:80px">&nbsp;@
							<input type="text" id="inputEmail2" name="email2" style="width:80px">
							<select style="width:100px" id="opt">
								<option>직접입력</option>
								<option value="naver.com">naver</option>
								<option value="daum.net">daum</option>
								<option value="gmail.com">gmail</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputImage">프로필 사진</label>
						<div class="controls">
							<input type="file" name="image" id="inputImage">
						</div>
					</div>
					<p id="i" style="margin-left:30%;margin-top:-20px;">이미지 파일만 올려야합니다</p>
					<div id="checkbox" style="margin-left:100px;">
						<label class="checkbox"> <input type="checkbox" required="required"> 홈페이지 이용약관 동의
						</label> <label class="checkbox"> <input type="checkbox" required="required"> 개인정보 이용약관 동의
						</label> <label class="checkbox"> <input type="checkbox" name="invite_agree" value="Y"> 초대 수신 여부 동의
						</label>
					</div>

					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn">가입하기</button>&nbsp;&nbsp;<button type="reset" class="btn" onclick="history.back()">취소</button>
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

