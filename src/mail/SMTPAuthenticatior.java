/*
 *  �ۼ��� : ������
 *  ���� : IDã��� ��й�ȣ ã�� �ÿ� ���� ���̹� SMTP������ �����ϱ� ���� ���̵�� ��й�ȣ�� �Է��ص� ��
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
