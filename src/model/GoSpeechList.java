/*
 *  �ۼ��� : ������
 *  ���� : ���� �������� �̵��ϴ� Ŀ�ǵ�
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoSpeechList implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		return "/WEB-INF/manage/Speech_List.jsp";
	}
	
}
