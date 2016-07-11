<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
.container{
	margin-top:100px;
}
#inputTerm1, #inputTerm2 {
	width:120px;
}
#update {
	margin-top: 80px;
}

#title {
	text-align: left;
	margin-bottom: -90px;
	font-size: 30px;
	font-family: fantasy;
}

#updateField {
	background-color: silver;
	margin-top: 30px;
}

#updateForm {
	padding-top: 40px;
	margin-left: 20px;
}
</style>
<script>
	$(document).ready(function(){
		$("#findSpeaker").click(function(){
			window.open("move?cmd=FindSpeaker", "", "width=500, height=500, scrollbar=yes, resizable=no");
		});
		
		$("#findPlace").click(function(){
			window.open("move?cmd=FindPlace", "", "width=500, height=500, scrollbar=yes, resizable=no");
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div id="insert">
				<div class="span3"></div>
				<div class="span8">
					<span id="title">강연 등록</span>
					<hr />
					<form class="form-horizontal" method="post" action="" name="f">


						<div class="control-group">
							<label class="control-label" for="inputName">강 연 자</label>
							<div class="controls">
								<input type="text" id="inputName" name="inputName" placeholder="강연자 이름" readonly="readonly">
								<button id="findSpeaker" class="btn">찾기</button>
							</div>
						</div>
						
						<div class="control-group">
							<label class="control-label" for="inputPlace">장 소</label>
							<div class="controls">
								<input type="text" id="inputPlace" name="inputPlace" placeholder="장  소" readonly="readonly">
								<button id="findPlace" class="btn">찾기</button>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputEntry">모집인원</label>
							<div class="controls">
								<input type="number" id="inputEntry" placeholder="모집인원">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputPrice">참여비</label>
							<div class="controls">
								<input type="number" id="inputPrice" placeholder="참여비">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputDate">강연일</label>
							<div class="controls">
								<input type="date" id="inputDate">
							</div>
						</div>


						<div class="control-group">
							<div class="controls">
								
								<button class="btn" type="reset" class="btn" onclick="history.back()">취소</button>
								<button class="btn" type="submit" class="btn">완료</button>
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