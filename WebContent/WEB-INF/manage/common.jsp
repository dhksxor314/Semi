<!-- 
������ : ������ ������ �ش�
�ۼ��� : ������
���� : �ش�
 -->


<%@ page contentType="text/html; charset=EUC-KR"%>
<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-inner">
		<a href="#" class="brand">���Ͽ����丮</a> <a class=" btn btn-navbar"
			data-toggle="collapse" data-target=".nav-collapse"> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>
		<div class="nav-collapse collapse">
			<ul class="nav">
				<li><a href="manage?cmd=Speech_List">��������</a>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">������ ���� <i class="caret"></i></a>
					<ul class="dropdown-menu">
						<li><a href="manage?cmd=Speaker_List">����</a></li>
						<li><a href="manage?cmd=Speaker_Grant">����</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">���Ӱ��� <i class="caret"></i></a>
					<ul class="dropdown-menu">
						<li><a href="manage?cmd=Meeting_List">����</a></li>
						<li><a href="manage?cmd=Meeting_Grant">����</a></li>
					</ul></li>
				<li><a href="manage?cmd=Member_List">ȸ������</a>
				<li><a href="manage?cmd=Place_List">��Ұ���</a>
				<li><a href="Logout.jsp">�α׾ƿ�</a></li>
				<li><a href="main.jsp">�Ϲ�ȸ�� ��������</a></li>
			</ul>
		</div>
	</div>
</nav>