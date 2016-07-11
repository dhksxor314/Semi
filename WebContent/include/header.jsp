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
						<li><a href="#">��������</a></li>
						<c:if test="${loginId==null && managerId==null}">
							<li><a href="Login.jsp">�α���</a>
						</c:if>
						<c:if test="${loginId!=null && identity=='member' }">
							<li class="dropdown">
								<div class="btn-group">
									<a class="btn btn-primary" href="front?cmd=speech"><i
										class="icon-user icon-white"></i>${loginName }</a> <a
										class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
										href="#"><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="front?cmd=speech">����������</a></li>
										<li class="divider"></li>
										<li><a href="Logout.jsp">�α׾ƿ�</a></li>
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
										<li><a href="front?cmd=speaker_open">����������</a></li>
										<li class="divider"></li>
										<li><a href="Logout.jsp">�α׾ƿ�</a></li>
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
										<li><a href="front?cmd=manage">������������</a></li>
										<li class="divider"></li>
										<li><a href="Logout.jsp">�α׾ƿ�</a></li>
									</ul>
								</div>
							</li>
						</c:if>
						<li><a href="#">������</a></li>
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
						class="btn btn-info btn-large">�����ϱ�</a></li>
					<li class="dropdown"><a class="dropdown-toggle btn-large"
						data-toggle="dropdown" href="#">�����ϱ�<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">����</a></li>
							<li><a href="control?cmd=joinlist">����</a></li>
						</ul></li>
				</ul>
			</div>
		</form>
		<div class="span5 pull-right">
			<form class="form-search pull-right">
				<input type="text" class="input-medium search-query" /> <input
					type="submit" value="�˻�" class="btn" />
			</form>
		</div>
	</div>
</div>
<!-- header -->

