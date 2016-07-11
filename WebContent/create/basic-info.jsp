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
				//$target.css('background-image', 'url(\"' + e.target.result + '\")'); // ������� ������
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

.filebox input[type="file"] { /* ���� �ʵ� ����� */
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
					<li id="nav-basic-info" class=""><a href="basic-info.jsp">STEP1.
							���� ����</a></li>
					<li id="nav-section" class=""><a href="section.jsp">STEP2.
							�ð�,���,����</a></li>
					<li id="nav-wisdomer" class=""><a href="wisdomer.jsp">STEP3.
							���å ����</a></li>
					<li id="nav-request-review" class=""><a
						href="request-review.jsp">�Ϸ�!</a></li>
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
								<label for="title">����</label> <input type="text" name="title"
									id="title" class="form-control" style="width: 80%"
									value="<%=title%>"
									placeholder="����: [���-å �Ǳ� ��Ŷ ��ũ��] ������ �̾߱⸦ �ŷ������� �����غ���!" />
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>���� ������ �� �巯����, ������� ��̸� �� �� �ְ� �����ּ���.</li>
								<li>�ٽ�Ű����+��� ȿ���� �־��ֽø� ���ƿ�:)<br /> ����1: �׸�å�� ���ؼ� ������ ��
									���������<br /> ����2: ���ֿ��� �Ϻ� �����ڼ��� �Բ� ü���غ���~!
								</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="cateogory">����</label> <select name="category"
									id="category" class="form-control">
									<option value="����" <%if (category.equals("����")) {%>
										selected="selected" <%}%>>����</option>
									<option value="����" <%if (category.equals("����")) {%>
										selected="selected" <%}%>>����</option>
									<option value="�λ�" <%if (category.equals("�λ�")) {%>
										selected="selected" <%}%>>�λ�</option>
									<option value="�뱸" <%if (category.equals("�뱸")) {%>
										selected="selected" <%}%>>�뱸</option>
									<option value="����" <%if (category.equals("����")) {%>
										selected="selected" <%}%>>����</option>
									<option value="��Ÿ" <%if (category.equals("��Ÿ")) {%>
										selected="selected" <%}%>>��Ÿ</option>
								</select>
							</div>
						</div>
						<div class="span4"></div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="description" style="width: 100%;"> �� ���� </label>
								<textarea class="form-control tinymce" id="description"
									name="description" rows="20" style="width: 80%"><%=description%></textarea>
								<div class="tinymce-fileupload hidden-xs" data-only-photo="true"
									data-filebox="WisdomeContent" data-keybox="17095"
									data-textarea="description"></div>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>���� ���� �ۼ��� �����Ͻ� �� �ۼ� ���̵带 �����ϼ���.</li>
								<li>�̸����⸦ ���� ���� �ۼ� ������ Ȯ���Ͻø� ���� �ϼ��� ���� ���� ������ �����մϴ�!</li>
								<li>������ ������ <span
									style="font-weight: bold; font-size: 14px;">&lsaquo;
										&rsaquo;</span>���� �ҽ��ڵ� �ٿ��ֱ⸦ �Ͻø� �˴ϴ�.
								</li>
								<li>��� � ��å�� ����Ǵ� ������ ���� �� ���� �ȳ� ���� ����ε� ��ġ�� �� �ֽ��ϴ�.<br />
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="filebox">
								<label for="cma_file">Ÿ��Ʋ �̹���</label> <input type="file"
									name="cma_file" id="cma_file" accept="image/*" capture="camera"
									onchange="getThumbnailPrivew(this,$('#cma_image'))" /> <br />
								<br />
								<div id="cma_image"
									style="width: 100%; max-width: 100%; display: none;"></div>
							</div>
							<strong>�̹����� �� ���� �̸����� �������ּ���!</strong>
						</div>
						<div class="span4">
							<ul>
								<li>������ ��ǥ�� �� �ִ� �̹��� �� �常 �������ּ���.</li>
								<li>900*450���� �ڵ� ��������˴ϴ�. ������ ���� ������ �̹����� ���������� ������� �����Ƿ� ��
									������ �´� ������ �÷��ּ���.</li>
								<li>�̹��� ũ��(1.5M)�� ����(JPG, PNG, BMP)�� ���ε� �� �� Ȯ�����ּ���!</li>
								<li>�̹����� �� ���� �̸����� �������ּ���!</li>
							</ul>
						</div>
					</div>
					<textarea name="titleImageBlob" id="titleImageBlob"
						style="display: none;"></textarea>
					<div class="row">
						<div class="span8">
							<div class="submit-group">
								<input type="submit" value="�����ϰ� ����"
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
	<!-- jquery�� �׻� ���� �־�� �� (���� �߿�) -->
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>