package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import dao.MeetingDao;
import dao.MemberDao;
import dao.NoticeDao;
import dao.PlaceDao;

public class DeleteCommand implements Command{

   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws IOException {
      
      req.setCharacterEncoding("euc-kr");
      String classify = req.getParameter("classify");
      String[] chk = req.getParameterValues("check");
      String url = "";
      
      PlaceDao place = new PlaceDao();
      MemberDao member = new MemberDao();
      NoticeDao notice = new NoticeDao();
      MeetingDao meeting = new MeetingDao();
      
      //장소를 삭제
      if(classify.equals("place")){
         url="/WEB-INF/manage/Place_List.jsp";

         for(int i=0;i<chk.length;i++){
            place.deletePlace(Integer.parseInt(chk[i]));
         }
      }
      //회원을 삭제
      else if(classify.equals("member")){
         url="/WEB-INF/Member_List.jsp";
         
         for(int i=0;i<chk.length;i++){
            member.deleteMember(Integer.parseInt(chk[i]));
         }
      }
      //공지사항을 삭제
      else if(classify.equals("notice")){
         url="Notice.jsp";
         
         for(int i=0;i<chk.length;i++){
            notice.deleteNotice(Integer.parseInt(chk[i]));
         }
      }
      else if(classify.equals("meeting") || classify.equals("speech")){
         
         String s_m="";
         if(classify.equals("meeting")){

            url="/WEB-INF/manage/Meeting_List.jsp";
            s_m="m";
         }
         else{
            url="/WEB-INF/manage/Speech_List.jsp";
            s_m="s";
         }
         
         for(int i=0;i<chk.length;i++){
            meeting.deleteMeeting(Integer.parseInt(chk[i]), s_m);
         }
      }
      
      return url;
   }
}