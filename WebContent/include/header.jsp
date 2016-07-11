<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<div class="container">
	<nav class="navbar">
		<div class="navbar-inner">
			<div class="nav-collapse collapse">
				<form class="navbar-form pull-right">
					<ul class="nav">
						<li><a href="#"></a>
						<li class="divider-vertical"></li>
						<li><a href="#">공지사항</a></li>
						<c:if test="${loginId==null && managerId==null}">
							<li><a href="Login.jsp">로그인</a>
						</c:if>
						<c:if test="${loginId!=null && identity=='member' }">
							<li class="dropdown">
								<div class="btn-group">
									<a class="btn btn-primary" href="front?cmd=speech"><i
										class="icon-user icon-white"></i>${loginName }</a> <a
										class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
										href="#"><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="front?cmd=speech">마이페이지</a></li>
										<li class="divider"></li>
										<li><a href="Logout.jsp">로그아웃</a></li>
									</ul>
								</div>
							</li>
						</c:if>
						<c:if test="${loginId!=null && identity=='speaker' }">
							<li class="dropdown">
								<div class="btn-group">
									<a class="btn btn-primary" href="front?cmd=speaker_open"><i
										class="icon-user icon-white"></i>${loginName }</a> <a
										class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
										href="#"><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="front?cmd=speaker_open">마이페이지</a></li>
										<li class="divider"></li>
										<li><a href="Logout.jsp">로그아웃</a></li>
									</ul>
								</div>
							</li>
						</c:if>
						<c:if test="${managerId!=null}">
							<li class="dropdown">
								<div class="btn-group">
									<a class="btn btn-primary" href="front?cmd=manage"><i
										class="icon-user icon-white"></i>${managerId }</a> <a
										class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
										href="#"><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="front?cmd=manage">관리자페이지</a></li>
										<li class="divider"></li>
										<li><a href="Logout.jsp">로그아웃</a></li>
									</ul>
								</div>
							</li>
						</c:if>
						<li><a href="#">고객센터</a></li>
					</ul>
				</form>
			</div>
		</div>
	</nav>
	<div class="row">
		<form class="form-inline">
			<div class="span7">
				<a href="../main.jsp"><img src="logo.jpg" width="200" height="50"
					align="left"></a>
				<ul class="nav nav-pills">
					<li><a href="control?cmd=create"
						class="btn btn-info btn-large">개설하기</a></li>
					<li class="dropdown"><a class="dropdown-toggle btn-large"
						data-toggle="dropdown" href="#">참가하기<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">강연</a></li>
							<li><a href="control?cmd=joinlist">모임</a></li>
						</ul></li>
				</ul>
			</div>
		</form>
		<div class="span5 pull-right">
			<form class="form-search pull-right">
				<input type="text" class="input-medium search-query" /> <input
					type="submit" value="검색" class="btn" />
			</form>
		</div>
	</div>
</div>
<!-- header -->

