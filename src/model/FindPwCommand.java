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
		String subject = "노하우 팩토리 비밀번호 찾기";
		String content = "<span>안녕하세요 <b>"+dto.getName()+"</b>님~!<br/><br/> <b>"+dto.getName()+"</b>님의 비밀번호는 <b>"+dto.getPassword()+"</b>입니다</span>";	
		
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
			     
			    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			    msg.setSubject(subject); // 제목
			     
			    Address fromAddr = new InternetAddress(from);
			    msg.setFrom(fromAddr); // 보내는 사람
			     
			    Address toAddr = new InternetAddress(to);
			    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
			     
			    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
			     
			    Transport.send(msg); // 전송
			} catch(Exception e){
			    System.out.println("전송 실패");
			}
			req.setAttribute("foundId", "메일로 비밀번호가 발송되었습니다.");

		}
		else{
			req.setAttribute("foundPw", "일치하는 정보가 없습니다");
		}
		
		return "Find_Password.jsp";
	}
}
