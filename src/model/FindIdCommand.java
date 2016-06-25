/*
 *  작성자 : 전현영
 *  설명 : 아이디 찾기 작업을 수행하는 Command
 *   
 */


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

public class FindIdCommand implements Command{
	
	
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		req.setCharacterEncoding("utf-8");

		MemberDao dao = new MemberDao();
		//이름과 이메일을 받아와서 해당 데이터가 있으면 가져온다.
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		MemberDto dto = dao.getId(name, email);
		//보내는 사람과 받는사람, 제목, 내용을 입력한다.
		String from = "hyeon454";
		String to = email;
		String subject = "노하우 팩토리 아이디 찾기";
		String content = "<span>안녕하세요 <b>"+dto.getName()+"</b>님~!<br/><br/> <b>"+dto.getName()+"</b>님의 아이디는 <b>"+dto.getId()+"</b>입니다</span>";	
		
		if(dto.getId()!=null){
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
			//성공했을 시에 view에서 alert를 사용하여 사용자에게 메일이 발송된 것을 알려준다 
			req.setAttribute("foundId", "메일로 ID가 발송되었습니다.");
			
		}
		else{
			//실패했을 시에 view에서 alert를 사용하여 사용자에게 일치하는 정보가 없다고 알려준다
			req.setAttribute("foundId", "일치하는 정보가 없습니다");
		}
		
		return "Find_Id.jsp";
	}
	
}
