/*
 *  �ۼ��� : ������
 *  ���� : ���ε� ������� ��µǴ� �������� �̵��ϴ� Ŀ�ǵ�
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoSpeakerList implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		return "/WEB-INF/manage/Speaker_List.jsp";
	}
	
}
