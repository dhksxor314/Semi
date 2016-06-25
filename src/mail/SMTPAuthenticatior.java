/*
 *  작성자 : 전현영
 *  설명 : ID찾기와 비밀번호 찾기 시에 사용될 네이버 SMTP서버에 접속하기 위한 아이디와 비밀번호를 입력해둔 곳
 *   
 */

package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("hyeon454", "hy4829");
	}
	
}
