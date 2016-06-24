package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import dao.ManagerDao;
import dao.MemberDao;
import dao.SpeakerDao;
import dto.ManagerDto;
import dto.MemberDto;
import dto.SpeakerDto;

public class LoginCommand implements Command{

   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
      
      String id = req.getParameter("id");
      String pass = req.getParameter("pass");
      String option = req.getParameter("option");
      
      String url="main.jsp";

      MemberDao dao = new MemberDao();
      ManagerDao dao1 = new ManagerDao();
      SpeakerDao dao2 = new SpeakerDao();
      
      MemberDto member;
      ManagerDto manager;
      SpeakerDto speaker; 
      
      HttpSession session = req.getSession();
      //���� ��ư�� �Ϲ�ȸ���� ���õ� ���¿��� �α��ι�ư�� ������ ��
      if(option.equals("member")){
         member=dao.getMember(id, pass);
         //�ҷ��� ���� ���� �ÿ� ���� ����
         if(member.getId()!=null){
            session.setAttribute("loginMem_num", member.getMem_num());
            session.setAttribute("loginId", member.getId());
            session.setAttribute("loginName", member.getName());
            session.setAttribute("identity", "member");
            session.setAttribute("loginImage", member.getImage());	
         }
         //���� �޽��� ����
         else{
            url="Login.jsp";
            req.setAttribute("fail", "��ġ�ϴ� ������ �����ϴ�.");
         }   
      }
      
      else if(option.equals("speaker")){
         speaker=dao2.loginSpeaker(id, pass);
         if(speaker.getId()!=null){
            session.setAttribute("loginMem_num", speaker.getSpeaker_num());
            session.setAttribute("loginId", speaker.getId());
            session.setAttribute("loginName", speaker.getName());
            session.setAttribute("identity", "speaker");
            session.setAttribute("loginImage", speaker.getImage());
         }
         else{
            url="Login.jsp";
            req.setAttribute("fail", "��ġ�ϴ� ������ �����ϴ�.");
         }   
      }
      
      //���� ��ư�� �����ڷ� ���õ� ���¿��� �α��ι�ư�� ������ ��
      else{
         manager=dao1.getManager(id, pass);
         //�ҷ��� ���� ���� �ÿ� ���� ����
         if(manager.getId()!=null){
            session.setAttribute("managerNum", manager.getManage_num());
            session.setAttribute("managerId", manager.getId());
            session.setAttribute("identity", "manager");
         }
         //���� �޽��� ����
         else{
            url="Login.jsp";
            req.setAttribute("fail", "��ġ�ϴ� ������ �����ϴ�.");
         }   
         
      }

      return url;
   }
   
}