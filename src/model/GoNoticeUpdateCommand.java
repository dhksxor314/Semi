package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoNoticeUpdateCommand implements Command {
	//�������� ������������ �̵�
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		int notice_num = Integer.parseInt(req.getParameter("notice_num"));
		
		return "Notice_Update.jsp?"+notice_num;
	}
	
}
