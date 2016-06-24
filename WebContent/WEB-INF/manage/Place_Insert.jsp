<!-- 
페이지 : 장소등록 페이지
작성자 : 전현영
설명 : 관리자가 장소를 등록할 때 사용 하는 페이지
 		
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
					<span id="title">장소 등록</span>
					<hr />
					<form class="form-horizontal" method="post" action="manage" name="f">
						<input type="hidden" name="cmd" value="place_insert"/>
						<div class="control-group">
							<label class="control-label" for="inputName">이름</label>
							<div class="controls">
								<input type="text" id="inputName" name="name" placeholder="이름">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputAddr">주소</label>
							<div class="controls">
								<input type="text" name="addr" id="inputAddr" placeholder="주소">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputCapacity">수용인원</label>
							<div class="controls">
								<input type="number" name="capacity" id="inputCapacity" placeholder="수용인원">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputTel">전화번호</label>
							<div class="controls">
								<input type="tel" name="tel" id="inputTel" placeholder="전화번호">
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">등록</button>
								<button type="reset" class="btn" onclick="manage?cmd=Place_List">취소</button>
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