<%@page import="create.placeDao"%>
<%@page import="java.util.Vector"%>
<%@page import="create.createDao"%>
<%@page import="create.placeDto"%>
<%@page import="basic.BasicBean"%>
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
<script
	src="//apis.daum.net/maps/maps3.js?apikey=a4cf36762294ecfa872a4ac59046062e6967d110&libraries=services"></script>



</head>


<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
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

<body>
	<%
		request.setCharacterEncoding("euc-kr");
		Object tickets = null, minTickets = null, price = null, date = null, startTime = null, endTime = null,
				placeAddress = null, placeno = null;
		if (session.getAttribute("tickets") != null) {
			tickets = session.getAttribute("tickets");
		} else {
			tickets = "0";
		}
		if (session.getAttribute("minTickets") != null) {
			minTickets = session.getAttribute("minTickets");
		} else {
			minTickets = "2";
		}
		if (session.getAttribute("price") != null) {
			price = session.getAttribute("price");
		} else {
			price = "0";
		}
		if (session.getAttribute("date") != null) {
			date = session.getAttribute("date");
		} else {
			date = "";
		}
		if (session.getAttribute("startTime") != null) {
			startTime = session.getAttribute("startTime");
		} else {
			startTime = "";
		}
		if (session.getAttribute("endTime") != null) {
			endTime = session.getAttribute("endTime");
		} else {
			endTime = "";
		}
		if (session.getAttribute("placeno") != null) {
			placeno = session.getAttribute("placeno");
		} else {
			placeno = "";
		}
		if (session.getAttribute("placeAddress") != null) {
			placeAddress = session.getAttribute("placeAddress");
		} else {
			placeAddress = "";
		}
		placeDto placedto = new placeDto();
		Vector<create.placeDto> vector = new Vector<create.placeDto>();
		placeDao dao = new placeDao();
		vector = dao.getplace2();
	%>
	<script>
		$(document).ready(function() {
			$("#placeno").change(function() {
				$("#place_num").val($("#placeno").val())
				fnTempList();
			})
		})
	</script>
	<script src="/create/ajax.js"></script>
	<%@ include file="../include/header.jsp" %>

	<input type="text" id="place_num" name="place_num" value=""/>
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
		<div class="row section">
			<div class="span12">
				<form class="form" id="formSection" method="post"
					action="control">
					<input type="hidden" id="cmd" name="cmd" value="wisdomer"/>
					<div class="row">
						<div class="span8">
							<div class="row">
								<div class="span6">
									<div class="form-group">
										<label for="tickets">�� �ο�</label> <input type="text"
											size="10" name="tickets" id="tickets" class="form-control"
											value="<%=tickets%>" />
									</div>
								</div>
								<div class="span6">
									<div class="form-group">
										<label for="minTickets">�ּ� �ο�</label> <select
											name="minTickets" id="minTickets" class="form-control">
											<option value="1" <%if (minTickets.equals("1")) {%>
												selected="selected" <%}%>>1</option>
											<option value="2" <%if (minTickets.equals("2")) {%>
												selected="selected" <%}%>>2</option>
											<option value="3" <%if (minTickets.equals("3")) {%>
												selected="selected" <%}%>>3</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>�� �ο��� �����ڸ� ������ �ο����� �������ּ���.</li>
								<li>�ּ� �ο��� ���ο����� ���ų� ���ƾ� �մϴ�.</li>
								<li>���� ���� ���� 8�� ����, �ּ� �ο��� �޼����� ���ϸ� ������ �ڵ����� ��ҵ˴ϴ�.</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="price">����</label> <input type="text" name="price"
									id="price" class="form-control" value="<%=price%>" />
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>���� ���� ���� ����
									<ol style="list-style-type: upper-alpha; padding-left: 15px;">
										<li>���å�� ����� ����, �ð��� ������ ���� ���� ������ �밡(������)</li>
										<li>�÷��� �̿�� 20%</li>
									</ol>
								</li>
							</ul>
							<span style="padding-left: 15px;">���� ���� ���� = (A+B)/������ ��</span>
						</div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="date">��¥</label>
								<div class="input-group date" id='startDate'>
									<input type='text' name="date" id="date" class="form-control"
										required form="formSection" value="<%=date%>" /> <span
										class="input-group-addon"
										style="border-top: 0; border-left: 0; border-right: 0; border-bottom: 1px solid #ddd; border-radius: 0; background-color: #fff;">
										<i class="fa fa-calendar"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="span4"></div>
					</div>
					<div class="row">
						<div class="span8">
							<div class="row">
								<div class="span6">
									<div class="form-group">
										<label for="startTime">���� �ð�</label> <input type="time"
											name="startTime" id="startTime" class="form-control" required
											form="formSection" size="30" step="600"
											data-placeholder="hh:mm" value="<%=startTime%>" />
									</div>
								</div>
								<div class="span6">
									<div class="form-group">
										<label for="endTime">���� �ð�</label> <input type="time"
											name="endTime" id="endTime" class="form-control" required
											form="formSection" size="30" step="600"
											data-placeholder="hh:mm" value="<%=endTime%>" />
									</div>
								</div>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>ȫ�� �Ⱓ�� ����Ͽ� ������ 15�� �̻��� �� �Ⱓ�� �δ� ���� ȿ�����Դϴ�.</li>
								<li>������ �� ���л��鿡�� ���� ���� ����7�� ���� �Ǵ� �ָ� �� �ð��� ��õ�帳�ϴ�.</li>
							</ul>
						</div>
					</div>

					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="placeName">��� �̸�</label>
								 <select id="placeno" name="placeno">
								 <%for(int i=0;i<vector.size();i++){ %>
									<option value="<%=vector.get(i).getPlace_num() %>" <%if (placeno.equals("1")) {%>
												selected="selected" <%}%>><%=vector.get(i).getPlace_name() %></option>
									<%} %>
								</select>
							</div>
						</div>
						<div class="span4">
							<ul>
								<li>�����ڰ� ã�ƿ��� ������ ��ó�� �������̳� �ǹ� �̸��� �Բ� �����ּ���.<br /> ��� �̸�
									(�α� ���帶ũ)
								</li>
							</ul>
						</div>
					</div>
					<div class="row">
						<p style="margin-top: -12px">
							<em class="link"> <a href="javascript:void(0);"
								onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
									Ȥ�� �ּ� ����� �߸� ������ ��쿡�� ���⿡ �������ּ���. </a>
							</em>
						</p>
						<div id="map" style="width: 100%; height: 350px;"></div>

						<script type="text/javascript"
							src="//apis.daum.net/maps/maps3.js?apikey=fc5090e3119f214cd8f924302e9e1de4&libraries=services">
							
						</script>
						<script>
							var httpRequest = null;
							var name = null
							var addr = null
							function fnTempList() {
								var param = "place_num="
										+ $("#place_num").val();

								sendRequest("GET", "/create/create_proc2.jsp", param,
										callback)
							}

							function callback() {
								if (httpRequest.readyState == 4) {
									if (httpRequest.status == 200) {
										var data = httpRequest.responseXML;
										var place = data
												.getElementsByTagName("place")[0];
										name = place.getElementsByTagName(
												"name").item(0).firstChild.nodeValue;
										addr = place.getElementsByTagName(
												"addr").item(0).firstChild.nodeValue;
										$("#place_name").val(name);
										$("#placeAddress").val(addr);
										a();
									} else {
										alert(httpRequest.status);
									}
								}
							}
							function a(){
							var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
							mapOption = {
								center : new daum.maps.LatLng(37.56791,
										126.98299), // ������ �߽���ǥ
								level : 3
							// ������ Ȯ�� ����
							};

							// ������ �����մϴ�    
							var map = new daum.maps.Map(mapContainer, mapOption);

							// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
							var geocoder = new daum.maps.services.Geocoder();

							// �ּҷ� ��ǥ�� �˻��մϴ�
							
							geocoder
									.addr2coord(
											"'"+$("#placeAddress").val()+"''",
											function(status, result) {

												// ���������� �˻��� �Ϸ������ 
												if (status === daum.maps.services.Status.OK) {

													var coords = new daum.maps.LatLng(
															result.addr[0].lat,
															result.addr[0].lng);

													// ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
													var marker = new daum.maps.Marker(
															{
																map : map,
																position : coords
															});

													// ����������� ��ҿ� ���� ������ ǥ���մϴ�
													var infowindow = new daum.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																		+ name
																		+ '</div>'
															});
													infowindow
															.open(map, marker);

													// ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
													map.setCenter(coords);
												}
											});
							}
						</script>

					</div>
					<div class="row">
						<div class="span8">
							<div class="form-group">
								<label for="placeAddress">�ּ�</label> <input type="text"
									name="placeAddress" id="placeAddress" class="form-control"
									required value="<%=placeAddress%>" />
							</div>
						</div>
						<div class="span4"></div>
					</div>
					<div class="submit-group">
						<input type="submit" value="�����ϰ� ����"
							class="btn btn-primary btn-sm" />
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