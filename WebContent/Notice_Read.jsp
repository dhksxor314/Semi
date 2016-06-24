<%@page import="dao.NoticeDao"%>
<%@page import="dto.NoticeDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
   href="bootstrap/css/bootstrap-responsive.min.css">
   <script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
   //������Ʈ �������� �̵�
   $(document).ready(function(){
      $("#updateBtn").click(function(){
         $("#updateForm").submit();
      });
   });
</script>
</head>
<body>
   <%
      NoticeDto dto = new NoticeDto();
      NoticeDao dao = new NoticeDao();

      int notice_num = Integer.parseInt(request.getParameter("notice_num"));
      dao.addCount(notice_num);
      dto = dao.getNotice(notice_num);////���۹��� ��(�⺻Ű�� notice_num)���� ����Ǿ� �ִ����� �ҷ��´�
   %>

   <%@ include file="include/header.jsp"%>

   <br />
   <br />

   <div class="row">
      <%@ include file="inline.jsp"%>

      <div class="span8">
         <form action="manage" method="post" name="updateForm" id="updateForm">
            <input type="hidden" name="notice_num" value="<%=notice_num%>"/>
            <input type="hidden" name="cmd" value="goNoticeUpdate"/>
            <table style="width:90%;height:90%">
               <thead>
                  <tr>
                     <td
                        style="background-color: silver; color: black; font-weight: bold;">���Ͽ�
                        ���丮 ����</td>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><input type="text" name="title" style="width:80%;background-color: white" placeholder="��  ��  ��  ��  ��" value="<%=dto.getTitle()%>" readonly="readonly"/></td>
                  </tr>
                  <tr>
                     <td style="height: 400px"><textarea style="width:95%;height:95%;margin-top:-1%;background-color: white" placeholder="��  ��  ��  ��  ��" readonly="readonly"><%=dto.getContent()%></textarea></td>
                  </tr>
               </tbody>
            </table>
         </form>
         <input class="btn" type="button" value="�������"    style="margin-left: 40%;" onclick="location.href='Notice.jsp'"/>&nbsp;&nbsp;
            <c:if test="${identity=='manager' }">   <input class="btn" type="button" value="����" id="updateBtn"/></c:if>
         <br/><br/>
      </div>
   </div>

   <script src="bootstrap/js/jquery-2.2.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>