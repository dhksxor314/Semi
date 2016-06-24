<!-- �������� -->

<%@page import="dto.NoticeDto"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
   href="bootstrap/css/bootstrap-responsive.min.css">
   <script src="bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<script>
   //�˻���ư�� �������� Ȯ��
   function check() {
      if (document.search.keyWord.value == "") {
         alert("�˻�� �Է��ϼ���.");
         document.search.keyWord.focus();
         return;
      }
      document.search.submit();
   }
   
   
   $(document).ready(function(){
      //����������� �̵�
      $("#insertBtn").click(function(){
         $("#goInsert").submit();
      });
      
      //����
      $("#delBtn2").click(function(){
         $("#del").submit();
      });
   });
   
   function Chk_Del(){
      //�����ϱ��� üũ�� ���� �ִ��� Ȯ��
      var e = $("input:checked");
      if(e.length==0){
         $("#delBtn").attr("href","#myModal1");
         return;
      }
      $("#delBtn").attr("href","#myModal");

   }

</script>
<body>
   <%!int totalRecord = 0;
   int numPerPage = 10;
   int pagePerBlock = 3;
   int totalPage = 0;
   int totalBlock = 0;
   int nowPage = 0;
   int nowBlock = 0;
   int beginPerPage = 0;%>
   <jsp:useBean id="dao" class="dao.NoticeDao" />
   <%
      request.setCharacterEncoding("euc-kr");
      response.setCharacterEncoding("euc-kr");

      String keyField = request.getParameter("keyField");
      String keyWord = request.getParameter("keyWord");

      if (keyField == null) {
         keyField = "title";
         keyWord = "";
      }

      Vector<NoticeDto> list = dao.getNoticeList(keyField, keyWord);

      totalRecord = list.size();
      totalPage = ((int) Math.ceil((double) totalRecord / numPerPage));

      if (request.getParameter("nowPage") != null)
         nowPage = Integer.parseInt(request.getParameter("nowPage"));

      if (request.getParameter("nowBlock") != null)
         nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

      totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));

      beginPerPage = nowPage * numPerPage;
   %>
   <%@ include file="include/header.jsp"%>

   <br />
   <br />
   <div id="search-div" style="margin-left: 15%; margin-bottom: 20px">
      <form class="navbar-form pull-letf" id="search-form" action="manage"
         method="post" name="search">
         <input type="hidden" name="cmd" value="search" /> <input
            type="hidden" name="classify" value="notice" /> <select
            name="keyField">
            <option value="title" <%if (keyField.equals("title")) {%>
               selected="selected" <%}%>>����</option>
            <option value="content" <%if (keyField.equals("content")) {%>
               selected="selected" <%}%>>����</option>
         </select> <input type="text" size="16" name="keyWord" value="<%=keyWord%>">
         <input class="btn" type="button" value="�˻�" onClick="check()">
      </form>
   </div>
   <div class="row">
      <%@ include file="inline.jsp"%>
      <div class="span8">
         <form action="manage" method="post" name="del" id="del">
            <input type="hidden" name="cmd" value="delete" /> <input
               type="hidden" name="classify" value="notice" />
            <table
               class="table table-bordered table-hover table-striped table-condensed">
               <thead>
                  <tr>
                     <th>��ȣ</th>
                     <th>����</th>
                     <th>��¥</th>
                     <th>��ȸ��</th>
                     <th></th>
                  </tr>
               </thead>
               <tbody>
                  <%
                     if (list.size() == 0) {
                  %>
                  <tr>
                     <td colspan="5" align="center">������ ����</td>
                  </tr>
                  <%
                     } else {
                        for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
                           if (i == totalRecord)
                              break;

                           NoticeDto dto = list.get(i);
                  %>
                  <tr>
                     <td align="center"><%=dto.getNotice_num()%></td>
                     <td><a
                        href="Notice_Read.jsp?notice_num=<%=dto.getNotice_num()%>"><%=dto.getTitle()%></a></td>
                     <td><%=dto.getReporting_date()%></td>
                     <td><%=dto.getCount()%></td>
                     <td><input type="checkbox" name="check"
                        value="<%=dto.getNotice_num()%>" /></td>
                  </tr>
                  <%
                     }
                     }
                  %>

               </tbody>
            </table>
         </form>
         <div class="pagination">
            <ul>
               <%
                  if (nowBlock > 0) {
               %>
               <li><a href="javascript:ch(0, 0)">���� </a></li>

               <%
                  }
               %>

               <%
                  for (int i = 0; i < pagePerBlock; i++) {
                     if ((nowBlock * pagePerBlock) + i == totalPage) {
                        break;
                     }
               %>

               <li><a href="javascript:ch(<%=i%>, 1)"> <%=i + 1 + (nowBlock * pagePerBlock)%></a></li>
               <%
                  }
               %>
               <%
                  if (totalBlock > nowBlock + 1) {
               %>
               <li><a href="javascript:ch(0, 2)">���� </a></li>
               <%
                  }
               %>
            </ul>
         </div>
            <c:if test="${identity=='manager' }">
            <input class="btn pull-right" type="button" value="���" id="insertBtn"/>&nbsp;&nbsp;
            <a href="#" role="button" class="btn pull-right" data-toggle="modal" onclick="Chk_Del()" id="delBtn">����</a>
            </c:if>

            <div id="myModal" class="modal hide fade" tabindex="-1"
               role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">��</button>
                  <h3 id="myModalLabel">����</h3>
               </div>
               <div class="modal-body">
                  <p>������ ������ ���ڵ带 �����Ͻðڽ��ϱ�?</p>
               </div>
               <div class="modal-footer">
                  <button class="btn" data-dismiss="modal" aria-hidden="true" id="delBtn2">��</button>
                  <button class="btn btn-primary" data-dismiss="modal">�ƴϿ�</button>
               </div>
            </div>
            
            <div id="myModal1" class="modal hide fade" tabindex="-1"
               role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">��</button>
                  <h3 id="myModalLabel">���� ����</h3>
               </div>
               <div class="modal-body">
                  <p>������ �����͸� �������� �����̽��ϴ�</p>
               </div>
               <div class="modal-footer">
                  <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Ȯ��</button>
               </div>
            </div>
      </div>
   </div>
   <script>
      function ch(i, j) { //�˻��� ����¡�� ���� ������ �����ϱ� ���� �Լ�
         
         if (j == 0) {//������ư�� ��������
            document.hiddenF.nowPage.value =
   <%=(nowBlock - 1) * pagePerBlock + pagePerBlock - 1%>
      ;
            document.hiddenF.nowBlock.value =
   <%=nowBlock - 1%>
      ;
         } else if (j == 1) {//������ ��ȣ�� ������ ��
            document.hiddenF.nowPage.value =
   <%=(nowBlock * pagePerBlock)%>
      + i;
            document.hiddenF.nowBlock.value =
   <%=nowBlock%>
      ;
         } else if (j == 2) {//���� ��ư�� ��������
            document.hiddenF.nowPage.value =
   <%=(nowBlock + 1) * pagePerBlock%>
      ;
            document.hiddenF.nowBlock.value =
   <%=nowBlock + 1%>
      ;
         }
         document.hiddenF.keyWord.value = document.search.keyWord.value;
         document.hiddenF.keyField.value = document.search.keyField.value;
         document.hiddenF.submit();
      }
   </script>
   <form action="manage" method="post" name="hiddenF">
      <input type="hidden" name="cmd" value="paging" /> <input
         type="hidden" name="classify" value="notice" /> <input type="hidden"
         name="nowPage" value="" /> <input type="hidden" name="nowBlock"
         value="" /> <input type="hidden" name="keyWord" value="" /> <input
         type="hidden" name="keyField" value="" />
   </form>
   <form action="manage" method="post" id="goInsert" name="goInsert">
      <input type="hidden" name="cmd" value="goNoticeInsert"/>
   </form>
   <script src="bootstrap/js/jquery-2.2.3.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>