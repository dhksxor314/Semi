<%@page import="create.createDao"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html >
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	function create() {
		window.location.href = "control?cmd=basicinfo";
	}
</script>
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
		int loginMem_num = Integer.parseInt(String.valueOf(session.getAttribute("loginMem_num")));
		Vector<create.createDto> vector = new Vector<create.createDto>();
		Vector<create.createDto> vector1 = new Vector<create.createDto>();
		createDao dao = new createDao();
		vector = dao.getList(loginMem_num);
		vector1 = dao.endmetting(loginMem_num);
	%>
	<%@ include file="../include/header.jsp"%>

	<div class="hidden-sm hidden-xs" style="padding-bottom: 60px;">
		<div class="menu-header">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="pull-left">
							<h4>개설하기</h4>
						</div>
						<div class="pull-right">
							<a href="#theModal" class="btn" data-toggle="modal">새로운 만남
								개설하기</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="modal hide fade" id="theModal">
						<div class="modal-header">
							<a href="#" class="close" data-dismiss="modal">&times;</a>
						</div>
						<div class="modal-body">
							<ol style="margin-bottom: 5px;">
								<li>&nbsp;입력해주신 연락처는 최종 확정 참가자들에게 전달됩니다.</li>
								<li>&nbsp;위즈돔 플랫폼 수수료는 총 참가비의 20%입니다.<small>(PG사 결제
										수수료 및 SNS홍보비, 부가세 포함)</small></li>
								<li>&nbsp;다음 사항에 해당할 경우, 별도 통보 없이 블라인드 조치될 수 있습니다.</li>
								<li style="list-style: none;">- 저작권에 제한이 있는 파일(이미지, 폰트 등)을
									사용한 경우</li>
								<li style="list-style: none;">- 위즈돔 플랫폼 외에서 참가비 결제를 진행하는 경우</li>
								<li style="list-style: none;">- 타인을 비방하는 표현 및 내용을 기재한 경우</li>
							</ol>
							<span class="text"><a href="/about/policy" target="_blank"><strong>개설자
										약관</strong></a>을 숙지하지 않아 발생하는 책임은 모두 개설자에게 귀속됩니다.</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger btn-block"
								onclick="create()">개설 정책에 동의하고 개설하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="tabbable tab-below">
				<!-- tabbable은  탭 제목과 컨텐츠를 한번에 묶어주는 역할, tab-below는 탭 아래 내용이 나오게끔 -->
				<ul class="nav nav-tabs">
					<!-- 탭 메뉴로 탐색할 수 있게 만들어줌 -->
					<li class="active"><a href="#tab1" data-toggle="tab">작성중
							모임</a></li>
					<!-- data-toggle은 탭을 눌렀을 때 동작할 수 있게 해줌 -->
					<li><a href="#tab2" data-toggle="tab">종료된 모임</a></li>
					<!-- active는 미리 선택되어 있도록 활성화 시켜놓음 -->
				</ul>
				<div class="tab-content">
					<!-- 탭에 해당하는 내용이 나올 부분 / 각 탭을 식별할 아이디를 지정 -->
					<div class="tab-pane active" id="tab1">
						<table align="center" width="80%" border="0" cellspacing="0"
							cellpadding="3">
							<tr>
								<td align=center colspan=2>
								<%
											if (vector.size() > 0) {
												%>
									<table border="0" width="100%" cellpadding="2" cellspacing="0">
									
										<tr align=center bgcolor=#D0D0D0 height=120%>
											<td>번호</td>
											<td>제목</td>
											<td>장소</td>
											<td>현재인원</td>
											<td>승인여부</td>
										</tr>
										<%
										for (int i = 0; i < vector.size(); i++) {
										%>
										<tr>
											<td><%=i + 1%></td>
											<td><a
												href="control?cmd=info&num=<%=vector.get(i).getNum()%>"><%=vector.get(i).getTitle()%></a></td>
											<td><%=vector.get(i).getPlace_name()%></td>
											<td><%=vector.get(i).getNow_person()%></td>
											<td><%=vector.get(i).getApproval()%></td>
										</tr>
										<%
											}
										%>
									</table> <%
 									} else {
 									%> 이 그룹에는 작성중인 모임이 없습니다 <%
 									}
 									%>
								</td>
							</tr>
						</table>
					</div>
					<div class="tab-pane" id="tab2">
						<table align="center" width="80%" border="0" cellspacing="0"
							cellpadding="3">
							<tr>
								<td align=center colspan=2>
									<%
										if (vector1.size() > 0) {
									%>
									<table border="0" width="100%" cellpadding="2" cellspacing="0">
										<tr align=center bgcolor=#D0D0D0 height=120%>
											<td>번호</td>
											<td>제목</td>
											<td>장소</td>
											<td>현재인원</td>
											<td>승인여부</td>
										</tr>
										<%
											for (int i = 0; i < vector1.size(); i++) {
										%>
										<tr>
											<td><%=i + 1%></td>
											<td><a
												href="control?cmd=info&num=<%=vector1.get(i).getNum()%>"><%=vector1.get(i).getTitle()%></a></td>
											<td><%=vector1.get(i).getPlace_name()%></td>
											<td><%=vector1.get(i).getNow_person()%></td>
											<td><%=vector1.get(i).getApproval()%></td>
										</tr>
										<%
											}
										%>
									</table>
								</td>
							</tr>
						</table>
						<%
							} else {
						%>
						이 그룹에는 종료된 만남이 없습니다
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<!-- jquery가 항상 먼저 있어야 함 (순서 중요) -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>