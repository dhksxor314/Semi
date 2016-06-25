<!-- 
페이지 : 해당 회원의 포인트 사용 및 적립 내역을 출력하는 페이지
작성자 : 전현영
설명 : 해당 회원의 포인트 사용 및 적립 내역을 출력하는 페이지
	
 -->


<%@page import="dao.PointDao"%>
<%@page import="dto.MemActivityDto"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>포인트 사용내역</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<style>
.container{
	margin-top:80px;
}

#title {
	text-align: left;
	font-size: 30px;
	font-family: fantasy;
}
body {
	margin-top: 50px
}
select {
	float:left;
	margin-top:5px;
	margin-right:10px;
	width:120px;
}
#search-div{
	float:left;
}
#search-form{
	float:left;
}
.pull-right{
	margin-right:5px;
}
.date{
	width:35%;
}
</style>
<%!int totalRecord = 0;
	int numPerPage = 10;
	int pagePerBlock = 3;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0;
	int beginPerPage = 0;%>
</head>
<script>
$("input[id^=searchBtn]").click(function(){
	
	if($("#keyWord").val()=="" && $("#start").val()=="" && $("#end").val()==""){
		alert("검색어를 입력하세요");
		return;
	}
	if($("#keyWord").val()!="" && $("#start").val()=="" && $("#end").val()==""){
		<% nowPage=0;nowBlock=0;%>
		$("#search-form").submit();
		return;
	}
	if($("#keyWord").val()=="" && $("#start").val()!="" && $("#end").val()!=""){			
		if($("#start").val()>$("#end").val()){
			alert("앞의 날짜가 뒤의 날짜보다 같거나 빠르지 않습니다.");
			return;
		}
		<% nowPage=0;nowBlock=0;%>
		$("#search-form").submit();	
		return;
	}
	if($("#keyWord").val()!="" && $("#start").val()!="" && $("#end").val()!=""){			
		if($("#start").val()>$("#end").val()){
			alert("앞의 날짜가 뒤의 날짜보다 같거나 빠르지 않습니다.");
			return;
		}
		<% nowPage=0;nowBlock=0;%>
		$("#search-form").submit();	
		return;
	}
	if($("#keyWord").val()=="" && ($("#start").val()=="" || $("#end").val()=="")){
		alert("날짜가 정확히 입력되지 않았습니다.");
		return;
	}			
	
});
</script>
<body>
<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");

		PointDao dao = new PointDao();
		
		String keyField = (String) request.getAttribute("keyField");
		String start = (String) request.getAttribute("start");
		String end = (String) request.getAttribute("end");
		String mem_num = request.getParameter("mem_num");

		if (keyField == null) {
			keyField = "all";
		}
		if(start==null){
			start="";
			end="";
		}

		Vector<MemActivityDto> list = dao.getActivityList(keyField, start, end, Integer.parseInt(mem_num));

		totalRecord = list.size();
		totalPage = ((int) Math.ceil((double) totalRecord / numPerPage));

		if (request.getAttribute("nowPage") != null)
			nowPage = (Integer) request.getAttribute("nowPage");

		if (request.getAttribute("nowBlock") != null)
			nowBlock = (Integer) request.getAttribute("nowBlock");

		totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));

		beginPerPage = nowPage * numPerPage;
	%>
	<div class="container">
		<div class="row">
			<div class="span12">
				<span id="title">포인트 내역</span><br/><br/><br/>
				<div id="search-div">
					
				<form class="navbar-form pull-letf" id="search-form" name="search" action="manage" method="post">
					<select name="keyField">
						<option value="all" <%if (keyField.equals("all")) {%> selected="selected"<%}%>>전체</option>
						<option value="s" <%if (keyField.equals("s")) {%> selected="selected"<%}%>>강연</option>
						<option value="m" <%if (keyField.equals("m")) {%> selected="selected"<%}%>>모임</option>
					</select>
					<br/><br/>
					<input type="date" name="start" class="date" value="<%=start%>"/>&nbsp;-
					<input type="date" name="end" class="date" value="<%=end%>"/>
					<input class="btn" type="button" id="searchBtn2" value="검색">
				</form>
				<br/>
				</div>
				
				<table
					class="table table-bordered table-hover table-striped table-condensed" style="margin-top:100px">
					<thead>
						<tr>
							<th>번호</th>
							<th>내용</th>
							<th>날짜</th>
							<th>적립</th>
							<th>사용</th>
						</tr>
					</thead>
					<tbody>
					<%
						if (list.size() == 0) {
					%>
						<tr>
							<td colspan="4" align="center">데이터 없음</td>
						</tr>
					<%
						} else {
							int a=0;
							for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
								if (i == totalRecord)
									break;
									
								MemActivityDto dto = list.get(i);
								a++;
					%>	
						<tr>
							<td><%=a %></td>
							<td><%=dto.getTitle() %></td>
							<td><%=dto.getReporting_date() %></td>
							<td><%=dto.getPoint() %></td>
							<td></td>
						</tr>
					</tbody>
					<%
							}
						}
					%>
					</tbody>
				</table>
				<div class="pagination">
							<ul>
								<%
									if (nowBlock > 0) {
								%>
								<li><a href="javascript:ch(0, 0)">이전 </a></li>

								<%
									}
								%>

								<%
									for (int i = 0; i < pagePerBlock; i++) {
										if ((nowBlock * pagePerBlock) + i == totalPage) {
											break;
										}
										if(((nowPage-i)%pagePerBlock)==0){//현재보고 있는 페이지의 글자색을 바꾼다
								%>

								<li><a href="javascript:ch(<%=i%>, 1)" style="color:red"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
								<%		}
										else{
								%>
								<li><a href="javascript:ch(<%=i%>, 1)"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
								<%			
										}
									}
								%>
								<%
									if (totalBlock > nowBlock + 1) {
								%>
								<li><a href="javascript:ch(0, 2)">다음 </a></li>
								<%
									}
								%>
							</ul>
						</div>
				<button onclick="self.close()">닫기</button>
			</div>
		</div>
	</div>
	<script>
		function ch(i, j) {
			if (j == 0) {
				document.hiddenF.nowPage.value =
	<%=(nowBlock - 1) * pagePerBlock + pagePerBlock - 1%>
		;
				document.hiddenF.nowBlock.value =
	<%=nowBlock - 1%>
		;
			} else if (j == 1) {
				document.hiddenF.nowPage.value =
	<%=(nowBlock * pagePerBlock)%>
		+ i;
				document.hiddenF.nowBlock.value =
	<%=nowBlock%>
		;
			} else if (j == 2) {
				document.hiddenF.nowPage.value =
	<%=(nowBlock + 1) * pagePerBlock%>
		;
				document.hiddenF.nowBlock.value =
	<%=nowBlock + 1%>
		;
			}
			document.hiddenF.keyField.value = document.search.keyField.value;
			document.hiddenF.start.value = document.search.start.value;
			document.hiddenF.end.value = document.search.end.value;
			document.hiddenF.submit();
		}
	</script>
	<form action="manage" method="post" name="hiddenF">
		<input type="hidden" name="cmd" value="paging" /> <input
			type="hidden" name="classify" value="point" /> <input
			type="hidden" name="nowPage" value="" /> <input type="hidden"
			name="nowBlock" value="" /> <input type="hidden" name="keyField" value="" />
			<input type="hidden" name="start" value="" />
			<input type="hidden" name="end" value="" />
	</form>
	<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>