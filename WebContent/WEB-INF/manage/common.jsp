<!-- 
페이지 : 관리자 페이지 해더
작성자 : 전현영
설명 : 해더
 -->


<%@ page contentType="text/html; charset=EUC-KR"%>
<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-inner">
		<a href="#" class="brand">노하우팩토리</a> <a class=" btn btn-navbar"
			data-toggle="collapse" data-target=".nav-collapse"> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>
		<div class="nav-collapse collapse">
			<ul class="nav">
				<li><a href="manage?cmd=Speech_List">강연관리</a>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">강연자 관리 <i class="caret"></i></a>
					<ul class="dropdown-menu">
						<li><a href="manage?cmd=Speaker_List">관리</a></li>
						<li><a href="manage?cmd=Speaker_Grant">승인</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">모임관리 <i class="caret"></i></a>
					<ul class="dropdown-menu">
						<li><a href="manage?cmd=Meeting_List">관리</a></li>
						<li><a href="manage?cmd=Meeting_Grant">승인</a></li>
					</ul></li>
				<li><a href="manage?cmd=Member_List">회원관리</a>
				<li><a href="manage?cmd=Place_List">장소관리</a>
				<li><a href="Logout.jsp">로그아웃</a></li>
				<li><a href="main.jsp">일반회원 페이지로</a></li>
			</ul>
		</div>
	</div>
</nav>