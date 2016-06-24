package model;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import dao.MemberDao;
import dto.MemberDto;
import mail.SMTPAuthenticatior;

public class FindPwCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		MemberDao dao = new MemberDao();
		String id = req.getParameter("id");
		String email = req.getParameter("email");

		MemberDto dto = dao.getPw(id, email);
		
		String from = "hyeon454";
		String to = email;
		String subject = "���Ͽ� ���丮 ��й�ȣ ã��";
		String content = "<span>�ȳ��ϼ��� <b>"+dto.getName()+"</b>��~!<br/><br/> <b>"+dto.getName()+"</b>���� ��й�ȣ�� <b>"+dto.getPassword()+"</b>�Դϴ�</span>";	
		
		if(dto.getPassword()!=null){
			
			try{
				
				Properties p = new Properties();
				
				p.put("mail.smtp.host", "smtp.naver.com");
				p.put("mail.smtp.port", "465");
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.debug", "true");
				p.put("mail.smtp.socketFactory.port", "465");
				p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				p.put("mail.smtp.socketFactory.fallback", "false");
				
			    Authenticator auth = new SMTPAuthenticatior();
			    Session ses = Session.getInstance(p, auth);
			     
			    ses.setDebug(true);
			     
			    MimeMessage msg = new MimeMessage(ses); // ������ ������ ���� ��ü
			    msg.setSubject(subject); // ����
			     
			    Address fromAddr = new InternetAddress(from);
			    msg.setFrom(fromAddr); // ������ ���
			     
			    Address toAddr = new InternetAddress(to);
			    msg.addRecipient(Message.RecipientType.TO, toAddr); // �޴� ���
			     
			    msg.setContent(content, "text/html;charset=UTF-8"); // ����� ���ڵ�
			     
			    Transport.send(msg); // ����
			} catch(Exception e){
			    System.out.println("���� ����");
			}
			req.setAttribute("foundId", "���Ϸ� ��й�ȣ�� �߼۵Ǿ����ϴ�.");

		}
		else{
			req.setAttribute("foundPw", "��ġ�ϴ� ������ �����ϴ�");
		}
		
		return "Find_Password.jsp";
	}
}
