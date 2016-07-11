<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html >
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	function getThumbnailPrivew(html, $target) {
		if (html.files && html.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$target.css('display', '');
				//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
				$target
						.html('<img src="' + e.target.result + '" border="0" alt="" />');
			}
			reader.readAsDataURL(html.files[0]);
		}
	}
</script>
</head>
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width: 100%;
	max-width: 100%;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
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
<style>
.basic-info input.form-control, .section input.form-control, .wisdomer input.form-control.solo,
	.request-review input.form-control.solo {
	border: none;
	box-shadow: none;
	-webkit-box-shadow: none;
	border-bottom: 1px solid #ddd;
}

.basic-info input.form-control:focus, .section input.form-control:focus,
	.wisdomer input.form-control.solo:focus, .request-review input.form-control.solo:focus
	{
	outline: none !important;
}

.basic-info textarea.form-control, .section textarea.form-control,
	.wisdomer textarea.form-control.solo, .request-review textarea.form-control
	{
	border: none;
	border-bottom: 1px solid #ddd;
}

.basic-info textarea.form-control:focus, .section textarea.form-control:focus,
	.wisdomer textarea.form-control.solo:focus, .request-review textarea.form-control:focus
	{
	outline: none !important;
}

.basic-info ul, .section ul, .wisdomer ul, .request-review ul {
	padding-left: 15px;
}

.basic-info .col-md-8, .section .col-md-8, .wisdomer .col-md-8,
	.request-review .col-md-8 {
	border-right: 1px solid #eee;
}

.basic-info .col-md-4, .section .col-md-4, .wisdomer .col-md-4,
	.request-review .col-md-4 {
	border-left: 1px solid #df5b5a;
	margin-top: 20px;
	font-size: 13px;
	color: #848484;
}

.basic-info .form-group, .section .form-group, .wisdomer .form-group,
	.request-review .form-group {
	margin-top: 15px;
}

.submit-group {
	margin-top: 30px;
}
</style>
<style>
#toTopBtn .top {
	visibility: visible;
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 50px;
	height: 50px;
	padding-top: 6px;
	border: 1px solid #eee;
	background-color: #fff;
	z-index: 999;
	text-align: center;
	font-size: 12px;
	font-weight: 600;
	color: #777;
	line-height: 1.4em;
	cursor: pointer;
	-webkit-box-shadow: 0px 0px 4px 1px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: 0px 0px 4px 1px rgba(0, 0, 0, 0.1);
	box-shadow: 0px 0px 4px 1px rgba(0, 0, 0, 0.1);
	display: none;
}
</style>
<style>
.make-step li a {
	border: 1px solid #ddd;
}
</style>
<body>
	<%
		Object title = null, description = null, category = null;
		if (session.getAttribute("title") != null) {
			title = session.getAttribute("title");
		} else {
			title = "";
		}
		if (session.getAttribute("description") != null) {
			description = session.getAttribute("description");
		} else {
			description = "";
		}
		if (session.getAttribute("category") != null) {
			category = session.getAttribute("category");
		} else {
			category = "";
		}
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
					<li id="nav-basic-info" class=""><a href="basic-info.jsp">STEP1.
							만남 내용</a></li>
					<li id="nav-section" class=""><a href="section.jsp">STEP2.
							시간,장소,가격</a></li>
					<li id="nav-wisdomer" class=""><a href="wisdomer.jsp">STEP3.
							사람책 정보</a></li>
					<li id="nav-request-review" class=""><a
						href="request-review.jsp">완료!</a></li>
				</ul>
			</div>
		</div>



		<div class="row basic-info">
			<div class="span12">
				<form class="form" id="formBasicInfo" method="post"
					action="control" enctype="multipart/form-data">
					<input type="hidden" name="cmd" id="cmd" value="section" />
					<div class="row">
						<div class="span8">
							<div class="form-group" style="margin-top: 0;">
								<label for="title">제목</label> <input type="text" name="title"
									id="title" class="form-control" style="width: 80%"
									value="<%=title%>"
									placeholder="예시: [사람-책 되기 툴킷 워크숍] 나만의 이야기를 매력적으로 구성해봐요!" />
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>만남 내용이 잘 드러나고, 사람들의 흥미를 끌 수 있게 적어주세요.</li>
								<li>핵심키워드+기대 효과를 넣어주시면 좋아요:)<br /> 예시1: 그림책을 통해서 나에게 더
									가까워지기<br /> 예시2: 전주에서 일본 전통자수를 함께 체험해봐요~!
								</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="cateogory">지역</label> <select name="category"
									id="category" class="form-control">
									<option value="서울" <%if (category.equals("서울")) {%>
										selected="selected" <%}%>>서울</option>
									<option value="대전" <%if (category.equals("대전")) {%>
										selected="selected" <%}%>>대전</option>
									<option value="부산" <%if (category.equals("부산")) {%>
										selected="selected" <%}%>>부산</option>
									<option value="대구" <%if (category.equals("대구")) {%>
										selected="selected" <%}%>>대구</option>
									<option value="제주" <%if (category.equals("제주")) {%>
										selected="selected" <%}%>>제주</option>
									<option value="기타" <%if (category.equals("기타")) {%>
										selected="selected" <%}%>>기타</option>
								</select>
							</div>
						</div>
						<div class="span4"></div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="description" style="width: 100%;"> 상세 내용 </label>
								<textarea class="form-control tinymce" id="description"
									name="description" rows="20" style="width: 80%"><%=description%></textarea>
								<div class="tinymce-fileupload hidden-xs" data-only-photo="true"
									data-filebox="WisdomeContent" data-keybox="17095"
									data-textarea="description"></div>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>만남 내용 작성이 막막하실 땐 작성 가이드를 참고하세요.</li>
								<li>미리보기를 통해 만남 작성 내용을 확인하시면 더욱 완성도 높은 만남 개설이 가능합니다!</li>
								<li>동영상 삽입은 <span
									style="font-weight: bold; font-size: 14px;">&lsaquo;
										&rsaquo;</span>에서 소스코드 붙여넣기를 하시면 됩니다.
								</li>
								<li>위즈돔 운영 정책에 위배되는 내용이 있을 시 사전 안내 없이 블라인드 조치될 수 있습니다.<br />
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="filebox">
								<label for="cma_file">타이틀 이미지</label> <input type="file"
									name="cma_file" id="cma_file" accept="image/*" capture="camera"
									onchange="getThumbnailPrivew(this,$('#cma_image'))" /> <br />
								<br />
								<div id="cma_image"
									style="width: 100%; max-width: 100%; display: none;"></div>
							</div>
							<strong>이미지는 꼭 영어 이름으로 지정해주세요!</strong>
						</div>
						<div class="span4">
							<ul>
								<li>만남을 대표할 수 있는 이미지 한 장만 선택해주세요.</li>
								<li>900*450으로 자동 리사이즈됩니다. 비율이 맞지 않으면 이미지가 정상적으로 노출되지 않으므로 꼭
									비율에 맞는 사진을 올려주세요.</li>
								<li>이미지 크기(1.5M)나 형식(JPG, PNG, BMP)을 업로드 전 꼭 확인해주세요!</li>
								<li>이미지는 꼭 영어 이름으로 지정해주세요!</li>
							</ul>
						</div>
					</div>
					<textarea name="titleImageBlob" id="titleImageBlob"
						style="display: none;"></textarea>
					<div class="row">
						<div class="span8">
							<div class="submit-group">
								<input type="submit" value="저장하고 다음"
									class="btn btn-primary btn-sm" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>